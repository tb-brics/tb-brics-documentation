# Reproducibility Tools 

This section is reserved to teach how to use the reproducibility tools of the project.

## Luigi

![Luigi Logo](./images/luigi_logo.png "Luigi")

Luigi is a pipeline framework that is intended to standardize the machine learning codes, make them more intuitive, contributive among team members, and prepared for execution, that is the core of the reproducibility concepts.

### How to use
I made a video of how to build Luigi pipelines from jupyter notebook codes, it can be accessed below.

For more information about luigi, access 
[Luigi docs](https://luigi.readthedocs.io/en/stable/). 


## Accessing LPS with singularity

It is very important to execute all experiments in a conteinerized way. But, LPS doesn't execute docker. Instead, it uses singularity to manage containers. So, for execute any code in LPS, we will first access a singularity container, created by you or the template created by me.

I pushed a docker image to my docker hub (it can be used  for a while, but this image must stay in tb_brics docker hub) that contains the usual libraries (tensorflow, scikit-learn, ...) working in LPS.

<br>

>**NOTE:** As LPS doesn't have AVX-512, it was necessary to install an specific version of tensorflow, for an example. So, this image is out of trouble for this set of libraries, and ready to work with them. But, it is necessary to pay attention when install other libraries.

<br>

### Commands:

Once inside a LPS machine, execute:

```
singularity exec docker://andrefpereira/tb_brics:0.6 bash
``` 
This will execute the docker container, with singularity, countaining some importants libraries, like tensorflow and scikit learn, that had some problems to execute with the standards libraries versions. If you need an additional library you can install inside of this container.  

## Mlflow

![Mlflow Logo](./images/mlflow_logo.png "Mlflow")

Mlflow is used for record the evolution of the machine learning experiments. More details about Mlflow can be seen [here](https://mlflow.org/).

### How to use

In the call of the luigi pipeline, that represents your code, write:

```python
# Starting experiment
mlflow.set_tracking_uri("https://sandbox.lps.ufrj.br/")                
mlflow.set_experiment("CrossValidationRotationNeuralNetwork")
mlflow.start_run(run_name="Teste")

# Luigi Pipeline
luigi.build([
        CrossValidationRotationNeuralNetwork(
            dataset_name="china",
            token_id="17f79bc8dd57ec1e416c7d2f7023a3f1a4450ae0"
        )
    ], 
        local_scheduler=True)

# Ending experiment
mlflow.end_run()
``` 
The firsts 3 lines will start the experiment and enables logging in mlflow. For logging files, images, parameters, metrics and models, use this functions on your code (inside luigi pipeline):

```python
mlflow.log_artifact() # Log general files and images
mlflow.log_params() # Log all params
mlflow.log_param() # Log specific param
mlflow.sklearn.log_model() # Log sklearn model (can log from other libraries too)
mlflow.log_metric() # Log metric value (accuracy, error, ...)
```
The experiment will be logged on https://sandbox.lps.ufrj.br/.

<br><br>

For further doubts, contact andre.pereira@poli.ufrj.br

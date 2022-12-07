# Reproducibility Tools 

This section is reserved to teach how to use the reproducibility tools of the project.

## Reproducibility-Env

It was created a repository called "Reproducibility-Env" that serves as a template for projects reproducibility. The repository is in [https://github.com/tb-brics/Reproducibility-Env](https://github.com/tb-brics/Reproducibility-Env).

Besides the README presented in the repository, it was recorded a handzone tutorial for explaining the process. This tutorial has 6 videos explaining: how to dockerize your project from the template; how build and run a Luigi pipeline; how to use Mlflow; how to run your project in LPS, with the template, using singularity; and it is presented the two Luigi Tasks developed to download datasets from Dorothy and to download the folds relations standard for cross validation. Link: [https://loom.com/invite/5811303ebabf4408853f8c6060a6f955](https://loom.com/invite/5811303ebabf4408853f8c6060a6f955) 

## Luigi

![Luigi Logo](./images/luigi_logo.png "Luigi")

Luigi is a pipeline framework that is intended to standardize the machine learning codes, make them more intuitive, contributive among team members, and let codes ready to execute, that is the core of the reproducibility concepts.

In the video 3 is explained how to use Luigi. For more information, access
[Luigi docs](https://luigi.readthedocs.io/en/stable/). 

### Download Dataset and GetFolds Task

Download Dataset task is used for download dataset from Dorothy to your machine and keep it updated with the Dorothy version. It is used in the beggining of your code for ensuring you are using the correct data. Anytime you run it, Luigi only will execute the download if it doesn't exist in your computer, or if it has a different version. It checks the version checking all files inside it.

GetFolds task is used for downloading the folds relations of the dataset specified for develop the cross validation. This task was developed because of the project standard for cross validation, that is to use 90 folds. So, a pickle file containing lists of lists is on Dorothy, each list is a fold containing all images inside it. This task downloads this relation and change the image name for the image local path in your computer.  

## Accessing LPS with singularity

LPS doesn't use docker to create and run containers, instead, it uses singularity. However, singularity allows building singularity image from docker image, turning the Dockerfile generalized for any machine, including LPS. Reproducibility-Env makes easy to do this conversion concentrating the commands needed in the "Makefile LPS" file. 

The steps for running singularity container in LPS are:

1º - Execute the command 
```
make push
``` 
in the machine you have build your docker image (outside LPS). It will push it to your Docker Hub. It is necessary to change the "DOCKER_HUB_USERNAME" variable, presented in the Makefile, to your docker hub username.

2º - Once pushed, access LPS and rename "Makefile" file to anything else, and rename "Makefile LPS" file to "Makefile". Now run 
```
make pull-start 
```
It will build and run a singularity image from the docker image in your Docker Hub.
After that you will be inside your container and you will be able to run your project on it.

>**NOTE:** As LPS doesn't have AVX-512, it was necessary to install an specific version of tensorflow. So, this image is out of trouble for this set of libraries, and ready to work with them. But, it is necessary to pay attention when install other libraries for compatibility.

>**Important !!!** The tensorflow-2.8.0rc0-cp38-cp38-linux_x86_64.whl wheel is necessary to build the Dockerfile. It is located in the project Google Drive on "BRICS - TB Latente/Reproducibility" path.

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
The firsts 3 lines will start the experiment and enables logging in mlflow. For logging files, images, parameters, metrics and models, use the functions below on your code (inside luigi pipeline):

```python
mlflow.log_artifact() # Log general files and images
mlflow.log_params() # Log all params
mlflow.log_param() # Log specific param
mlflow.sklearn.log_model() # Log sklearn model (can log from others libraries too)
mlflow.log_metric() # Log metric value (accuracy, error, ...)
```
The experiment will be logged on https://sandbox.lps.ufrj.br/.

<br><br>

For further doubts, contact andre.pereira@poli.ufrj.br

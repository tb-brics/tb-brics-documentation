# How to generate the documentation

## Requirements

You must have the software "sphinx" and the libraries "recommark", "sphinx-markdown-tables" and "sphinx-rtd-theme" installed. 

1. Sphinx has differents manners to install depending of the OS. You can access https://www.sphinx-doc.org/en/master/usage/installation.html to have the details. 

<br>

2. To install the libraries, you must digit on the command line:

    ```
    pip install recommonmark 
    pip install sphinx-markdown-tables
    pip install sphinx-rtd-theme
    ```

## Usage

1. After clonning the repository, create the .html files with the following command:

    ```
    make html
    ```
    In Windows, add ".\\" before "make".

<br>

2. To open the index.html generated, you can digit:
    ```
    make view
    ```

    This will open it in Microsoft Edge, on Windows, and in Google Chrome, on Linux.


3. If you made any changes on the files, you can run: 
    ```
    make reinstall
    ```
    which will delete the old htmls and create new ones with the modifications applied.


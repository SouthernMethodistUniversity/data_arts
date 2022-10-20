# Usage

## Shell

1. Clone the repo on M2.
2. Add the path of the cloned repo to be used with Lmod via `module use <path_to_repo>`.
3. Load the module via `module load data_arts`
4. Use the `python3` and `jupyter-lab` commands as usual.

## HPC Portal JupyterLab

1. Clone the repo on M2.
2. On the HPC Portal go to "Interactice Apps", "JupyterLab.
3. Under "Select Python Environment" select "Custom Environment - only use what is specified below".
4. Under "Custom environment settings" add:

```{sh}
module use <path_to_repo>
module load data_arts
```

5. Set other compute resources as needed.


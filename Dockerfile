# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
# https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook
FROM jupyter/minimal-notebook

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}

USER root
RUN chown -R ${NB_UID}:${NB_UID} ${HOME}
#RUN python2 -m pip install ipykernel

USER ${NB_USER}



FROM jupyter/scipy-notebook:cf6258237ff9
RUN pip install --no-cache-dir notebook==5.2.1


RUN pip install jupyter-console
RUN pip install pyslha
RUN pip install bash_kernel


ENV NB_USER sarah
ENV NB_UID 1000
ENV HOME /home/${NB_USER}


RUN adduser --disabled-password \
    --gecos "Default user" \
        --uid ${NB_UID} \
	    ${NB_USER}
	    
WORKDIR ${HOME}

USER ${NB_USER}


# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN apt-get install bash-completion 
RUN chown -R ${NB_UID}:${NB_UID} ${HOME}
#RUN python2 -m pip install ipykernel

USER ${NB_USER}
#python2 -m ipykernel install --user




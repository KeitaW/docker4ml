FROM tensorflow/tensorflow:latest-gpu-py3
LABEL maintainer="Zimovnov Andrey <zimovnov@gmail.com>"
ARG DEBIAN_FRONTEND=noninteractive

# install apt packages
RUN apt-get update
RUN apt-get install -yq htop nano git wget libglib2.0-0 ffmpeg

RUN pip --no-cache-dir install h5py==2.7.0 \
                joblib \
                jupyter \
                ipywidgets \
                jupyter_contrib_nbextensions \
                Keras==2.0.6 \
                matplotlib==2.0.0 \
                nltk==3.2.4 \
                numpy==1.11.2 \
                opencv-python==3.3.0.9 \
                pandas==0.19.2 \
                Pillow==4.0.0 \
                requests==2.12.4 \
                scikit-learn==0.18.2 \
                scipy==0.18.1 \
                tqdm==4.15.0
# # setup juptyer
# RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
# RUN jupyter contrib nbextension install --user
# RUN jupyter nbextension enable codefolding/main
# RUN echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py
# RUN echo "c.NotebookApp.port = 8080" >> /root/.jupyter/jupyter_notebook_config.py
# RUN echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py
# # TensorBoard
# EXPOSE 6006
# # IPython
# EXPOSE 8888
# 
# WORKDIR "/notebooks"
# 
# CMD ["/run_jupyter.sh", "--allow-root"]

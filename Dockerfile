FROM tensorflow/tensorflow:latest-gpu-py3
LABEL maintainer="Keita Watanabe <keitaw09@gmail.com>"
ARG DEBIAN_FRONTEND=noninteractive

# install apt packages
RUN apt-get update
RUN apt-get install -yq htop nano git wget libglib2.0-0 ffmpeg libgtk2.0-0
RUN pip install --upgrade pip 
RUN pip --no-cache-dir install h5py \
                joblib \
                jupyter \
                ipywidgets \
                jupyter_contrib_nbextensions \
                Keras \
                matplotlib \
                nltk \
                numpy \
                opencv-python \
                pandas \
                Pillow \
                requests \
                scikit-learn \
                scipy \
                tqdm \
                torch \
                torchvision
RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.0-linux-x86_64.tar.gz
RUN tar -xvzf julia-1.1.0-linux-x86_64.tar.gz
RUN mv julia-1.1.0 /usr/local/lib
RUN ln -s /usr/local/lib/julia-1.1.0/bin/julia /usr/local/bin/julia 
# Install packages
RUN echo 'import Pkg\n\
Pkg.add("DataFrames")\n\
Pkg.add("Distributions")\n\
Pkg.add("JSON")\n\
Pkg.add("MatrixMarket")\n\
Pkg.add("NPZ")\n\
Pkg.add("ProgressMeter")\n\
Pkg.add("PyCall")\n\
Pkg.add("PyPlot")\n\
Pkg.add("Plots")\n\
Pkg.add("PlotlyJS")\n\
Pkg.add("ORCA")\n\
Pkg.add("IJulia")\n\
using DataFrames\n\
using Distributions\n\
using JSON\n\
using MatrixMarket\n\
using NPZ\n\
using ProgressMeter\n\
using PyCall\n\
using PyPlot\n\
using Plots\n\
using PlotlyJS\n\
using ORCA\n\
using IJulia' > /tmp/tmp.jl
RUN cat /tmp/tmp.jl
RUN julia /tmp/tmp.jl
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

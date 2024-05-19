### Filename: Dockerfile
# Based on https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/scripts/install-comfyui-venv-linux.sh
FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04
ARG BASEDIR=/usr/src
ARG COMFYDIR=$BASEDIR/ComfyUI
#ARG LISTENPORT=8188

# Update image, install tools, & download ComfyUI from Github
WORKDIR $BASEDIR
RUN apt update && \
    apt upgrade -y && \
    apt install git curl wget python3 python3-pip -y && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    git clone https://github.com/comfyanonymous/ComfyUI
WORKDIR $COMFYDIR/custom_nodes
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager && \
    git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack && \
    git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere && \
    git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes && \
    git clone https://github.com/ali1234/comfyui-job-iterator && \
    git clone https://github.com/Ttl/ComfyUi_NNLatentUpscale.git
WORKDIR $COMFYDIR/custom_nodes/ComfyUI-Impact-Pack
RUN git clone https://github.com/ltdrdata/ComfyUI-Impact-Subpack impact_subpack

## Copy models
WORKDIR $COMFYDIR
COPY models models

## Install dependencies
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121 && \
    pip install -r requirements.txt && \
    pip install -r custom_nodes/ComfyUI-Manager/requirements.txt

## TO DO
# Needed custom notes:
#    DWPreprocessor --
#    IPAdapterApply --
#    NNLatentUpscale



## Start ComfyUI
WORKDIR $COMFYDIR
EXPOSE $LISTENPORT   
# Remember to use the '-p 80:8818' or '-P' flag with your 'docker run' command.
CMD python main.py --preview-method auto --listen --port 8188

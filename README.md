# reposer-docker
_This is copied from my ComfyUI-docker repo. I'll need to update this readme soon._

The goal of this project is to create a working docker image of ComfyUI capable of running the [Reposer Plus](https://www.youtube.com/watch?v=ZcCfwTkYSz8) workflow on shared computing services like RunPod.  It's not the goal to create an image for public consuption, but feel free to fork it and change it to fit your wants/needs/desires, but you're pretty much on your own (IOW, no support offered).

## Builing the docker image
1. Run *download_models.sh* to download the models and verify their integrity.
2. Build the image. ```docker build . -t yourusername/reposer-docker```
3. Run the image. ```docker run -p80:8188 yourusername/reposer-docker```  
_You can change to host port ('80' in the example above) to any open TCP port you choose. Just remember to point your browser to that port when you run the image (e.g., http://localhost:80)_.

## Useful links
- [comfyanonymous/ComfyUI [github]](https://github.com/comfyanonymous/ComfyUI)
- [Setting Up NVIDIA CUDA Toolkit in a Docker Container on Debian/Ubuntu](https://linuxconfig.org/setting-up-nvidia-cuda-toolkit-in-a-docker-container-on-debian-ubuntu)
- [_nvidia/cuda_ docker image [dockerhub]](https://hub.docker.com/r/nvidia/cuda/)
- [ComfyUI Command Line Arguments: Informational [reddit]](https://www.reddit.com/r/comfyui/comments/15jxydu/comfyui_command_line_arguments_informational/)
- [Docker Build: A Beginner’s Guide to Building Docker Images](https://stackify.com/docker-build-a-beginners-guide-to-building-docker-images/)
- [Dockerfile reference](https://docs.docker.com/reference/dockerfile/)
- [comfyui_colab_with_manager.ipynb [Google Colab]](https://colab.research.google.com/github/ltdrdata/ComfyUI-Manager/blob/main/notebooks/comfyui_colab_with_manager.ipynb)
- [nerdyrodent/AVeryComfyNerd](https://github.com/nerdyrodent/AVeryComfyNerd): A variety of ComfyUI related workflows and other stuff from the creator of the [Reposer](https://www.youtube.com/watch?v=SacK9tMVNUA) and [Reposer Plus](https://www.youtube.com/watch?v=ZcCfwTkYSz8) workflows.

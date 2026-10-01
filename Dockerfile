FROM runpod/worker-comfyui:5.10.0-base

# Custom node used by your workflow
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/kijai/ComfyUI-KJNodes.git && \
    cd ComfyUI-KJNodes && \
    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# Point ComfyUI at the models on your network volume
RUN rm -f /comfyui/extra_model_paths.yaml
COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml

FROM runpod/worker-comfyui:5.10.0-base

# KJNodes: exact commit from your PC
RUN cd /comfyui/custom_nodes && git clone https://github.com/kijai/ComfyUI-KJNodes ComfyUI-KJNodes && cd ComfyUI-KJNodes && git checkout d3cfe21625e5170126ce06fbfcfe1d88108688c3 && if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

RUN pip install librosa imageio-ffmpeg && python -c "import librosa, imageio_ffmpeg, sys; print('deps OK', sys.executable, imageio_ffmpeg.get_ffmpeg_exe())"

# Registry packs: exact versions from your PC
RUN comfy-node-install comfyui-videohelpersuite@1.7.9 rgthree-comfy@1.0.2608210019 comfyui-vrgamedevgirl@9.1.1

RUN rm -f /comfyui/extra_model_paths.yaml
COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml

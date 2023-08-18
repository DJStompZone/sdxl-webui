FROM python:3.9

WORKDIR /app

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y
RUN pip install torch && pip install accelerate transformers invisible-watermark "numpy>=1.17" "PyWavelets>=1.1.1" "opencv-python>=4.1.0.25" safetensors "gradio==3.11.0"
RUN pip install git+https://github.com/huggingface/diffusers.git

ENV PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:128

CMD ["python", "app.py", "--SHARE=true"]

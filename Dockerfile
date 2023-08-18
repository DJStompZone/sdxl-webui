FROM python:3.9

WORKDIR /app

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y

RUN pip install --extra-index-url "https://download.pytorch.org/whl/cu113" "torch==2.0.1"
RUN pip install -r requirements.txt --extra-index-url "https://download.pytorch.org/whl/cu113"
RUN pip install git+https://github.com/huggingface/diffusers.git --extra-index-url "https://download.pytorch.org/whl/cu113"

ENV PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:128

CMD ["python", "app.py", "--SHARE=true"]

FROM ubuntu:questing

# disable interactive functions
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt install -y bash-completion command-not-found \
      docker.io docker-compose ripgrep \
      git make ninja-build libtool pkg-config \
      libxml2-dev libprotobuf-dev protobuf-compiler \
      libagg-dev \
      libfreetype6-dev \
      libcairo2-dev \
      libpangocairo-1.0-0 libpango1.0-dev \
      qtdeclarative5-dev libqt5svg5-dev \
      qtlocation5-dev qtpositioning5-dev qttools5-dev-tools qttools5-dev qtmultimedia5-dev \
      libglut3.12 libglut-dev \
      libmarisa-dev \
      doxygen \
      swig openjdk-8-jdk \
      locales \
      catch2 \
      python3-pip python3.12-venv \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.utf8
ENV QT_QPA_PLATFORM=offscreen

RUN apt-get update && apt-get install -y \
          cmake \
          g++ \
    && rm -rf /var/lib/apt/lists/*
          
RUN curl -fsSL https://claude.ai/install.sh | bash
RUN chmod -R og+rx /root
ENV PATH="/root/.local/bin/:${PATH}"

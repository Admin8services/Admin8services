# Sử dụng image workspace-full của Gitpod làm nền tảng
FROM gitpod/workspace-full

# Cài đặt phiên bản Go cụ thể
USER gitpod
RUN goenv install 1.21.0 && \
    goenv global 1.21.0 && \
    echo 'export PATH="$HOME/.goenv/bin:$PATH"' >> ~/.bashrc.d/90-goenv && \
    echo 'eval "$(goenv init -)"' >> ~/.bashrc.d/90-goenv

# Cài đặt Protobuf Compiler
USER root
RUN apt-get update && \
    apt-get install -y protobuf-compiler
USER gitpod

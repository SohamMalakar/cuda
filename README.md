# Running a CUDA Program

## Prerequisites

Before you can run a CUDA program, you should ensure you have the following prerequisites installed:

1. **NVIDIA GPU**: Make sure you have an NVIDIA GPU that supports CUDA.

2. **NVIDIA CUDA Toolkit**: Download and install the NVIDIA CUDA Toolkit.

3. **C/C++ Compiler**: You'll need a C/C++ compiler to build the CUDA program.

4. **NVIDIA Driver**: Ensure that you have the latest NVIDIA driver installed for your GPU.

## Installing NVIDIA CUDA Toolkit on Ubuntu

If you're using Ubuntu and the NVIDIA CUDA Toolkit isn't already installed, you can follow these steps to install it:

1. **Update Your Package Lists**:

   ```bash
   sudo apt update
   ```

2. **Install NVIDIA Driver and CUDA Toolkit**:

   Install the NVIDIA CUDA Toolkit using the following command:

   ```bash
   sudo apt install nvidia-cuda-toolkit
   ```

## Building the CUDA Program

Once you have the prerequisites in place, you can build your CUDA program. Here's a high-level overview of the process:

1. **Write your CUDA code**: Create or modify your C/C++ program to include CUDA kernels.

2. **Compile your CUDA code**: Use the `nvcc` compiler included with the CUDA Toolkit to compile your code.

   ```bash
   nvcc -o my_cuda_program my_cuda_program.cu
   ```

3. **Run your CUDA program**: Execute your CUDA program as you would any other executable.

   ```bash
   ./my_cuda_program
   ```

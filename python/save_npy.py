import argparse
import numpy as np

if __name__ == "__main__":

    # Create argument parser that allows the user to specify the path to the npy file.
    parser = argparse.ArgumentParser()
    parser.add_argument("--npy_file_path", type=str, required=True)
    args = parser.parse_args()
    npy_file_path = args.npy_file_path

    # Create a 4D numpy float array of linear layout.
    tensor_shape = (2, 3, 4, 5)
    tensor = np.arange(np.prod(tensor_shape)).reshape(tensor_shape).astype(
        np.float32)

    # Save the data
    np.save(npy_file_path, tensor)

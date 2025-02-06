import argparse
import numpy as np

if __name__ == "__main__":

    # Create argument parser that allows the user to specify the path to the npy file.
    parser = argparse.ArgumentParser()
    parser.add_argument("--npy_file_path", type=str, required=True)
    args = parser.parse_args()
    npy_file_path = args.npy_file_path

    # Load the data
    tensor = np.load(npy_file_path)

    assert tensor.shape == (2, 3, 4, 5)

    for i in range(2):
        for j in range(3):
            for k in range(4):
                for l in range(5):
                    assert tensor[i, j, k,
                                  l] == i * 3 * 4 * 5 + j * 4 * 5 + k * 5 + l

    assert tensor.dtype == np.float32

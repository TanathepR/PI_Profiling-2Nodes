from mpi4py import MPI
import numpy as np

def calculate_pi(n):
    np.random.seed()
    count = 0
    for _ in range(n):
        x, y = np.random.uniform(-1, 1, 2)
        if x**2 + y**2 <= 1:
            count += 1
    return count

def main():
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    size = comm.Get_size()

    n = 1000000  # Number of random points per process
    local_count = calculate_pi(n)
    total_count = comm.reduce(local_count, op=MPI.SUM, root=0)

    if rank == 0:
        pi_estimate = (4 * total_count) / (n * size)
        print(f"Estimated value of pi: {pi_estimate}")

if __name__ == "__main__":
    main()

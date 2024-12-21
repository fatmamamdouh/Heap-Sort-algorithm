
void heapify(List<int> arr, int n, int i) {
  int largest = i; // Initialize largest as root
  int left = 2 * i + 1; // Left child
  int right = 2 * i + 2; // Right child

  // If left child is larger than root
  if (left < n && arr[left] > arr[largest]) {
    largest = left;
  }

  // If right child is larger than largest so far
  if (right < n && arr[right] > arr[largest]) {
    largest = right;
  }

  // If largest is not root
  if (largest != i) {
    int swap = arr[i];
    arr[i] = arr[largest];
    arr[largest] = swap;

    // Recursively heapify the affected subtree
    heapify(arr, n, largest);
  }
}

void buildMaxHeap(List<int> arr, int n) {
  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(arr, n, i);
  }
}

void heapSort(List<int> arr) {
  int n = arr.length;

  // Step 1: Build max heap
  buildMaxHeap(arr, n);

  // Step 2: Extract elements from heap one by one
  for (int i = n - 1; i > 0; i--) {
    // Move current root to end
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    // Call heapify on the reduced heap
    heapify(arr, i, 0);
  }
}

void main() {
  List<int> arr = [9, 7, 2, 25, 0, 32];
  print("Original array: $arr");

  heapSort(arr);
  print("Sorted array: $arr");
}

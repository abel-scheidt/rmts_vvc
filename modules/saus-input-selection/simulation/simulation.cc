#include <bits/stdc++.h>

using namespace std;

void print_vector(array<int, 32> &input_vector, string name) {
    cout << "-" << name << "-" << endl;
    for (int i = 0; i < 32; i++) {
        if (i > 0) cout << " ";
        cout << input_vector[i];
    }
    cout << endl;
}

array<int, 32> t2s(array<int, 32> &input_vector, int N) {
    array<int, 32> rearranged_vector;

    for (int pos = 0; pos < 32; pos++) {
        int R = pos % N;
        int parity = R % 2; // or p % 2
        int new_pos = (pos / N) * N;

        if (pos / (N / 2) % 2 == 0)
            new_pos += 2 * R - parity;
        else {
            new_pos += (N - 1) - 2 * (R - parity - N / 2) - (1 - parity);
        }

        rearranged_vector[new_pos] = input_vector[pos];
    }

    return rearranged_vector;
}

array<int, 32> decompose(array<int, 32> input_vector, int N) {
    for (int depth = N; depth >= 4; depth /= 2) {
        for (int pos = 0; pos < depth; pos += 4) {
            input_vector[pos] = input_vector[pos] + input_vector[pos+3];
            input_vector[pos+1] = input_vector[pos+1] + input_vector[pos+2];
            input_vector[pos+2] = input_vector[pos+1] - input_vector[pos+2];
            input_vector[pos+3] = input_vector[pos] - input_vector[pos + 3];
        }
        print_vector(input_vector, "Decomposing...");
    }

    return input_vector;
}

int main() {
    int N;
    array<int, 32> input_vector, rearranged_vector, decomposed_vector;

    cin >> N;
    for (int i = 0; i < 32; i++) cin >> input_vector[i];

    rearranged_vector = t2s(input_vector, N);
    decomposed_vector = decompose(rearranged_vector, N);

    print_vector(rearranged_vector, "Rearranged Vector");
    print_vector(decomposed_vector, "Decomposed Vector");
}

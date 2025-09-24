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

// Nota: Caso N=4, nao altera o vetor
// Funcionando!
array<int, 32> t2s(array<int, 32> &input_vector, int N, int depth) {
    array<int, 32> rearranged_vector = input_vector;

    for (int pos = 0; pos < (32 >> depth); pos++) {
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

// Nota: Caso N=4, nao altera o vetor
// Funcionando!
array<int, 32> t2s_back(array<int, 32> &input_vector, int N) {
    array<int, 32> rearranged_vector = input_vector;

    for (int pos = 0; pos < N; pos++) {
        int new_pos;
        if ((pos % 4) / 2) { // Odd
            new_pos = N / 2 + pos / 2 - pos % 2;
        } else { // Even
            new_pos = pos / 2 + pos % 2; // Or ((pos + 1) / 2)
        }
        rearranged_vector[new_pos] = input_vector[pos];
    }

    return rearranged_vector;
}

array<int, 32> decompose(array<int, 32> input_vector, int N) {
    int max_depth = __builtin_ffs(N) - 2;
    for (int depth = 0; depth < max_depth; depth++) {
        cout << "\nDecomposing... Current depth = " << depth << endl;
        print_vector(input_vector, "Raw vector");
        input_vector = t2s(input_vector, N, depth);
        print_vector(input_vector, "T2s applied");

        for (int pos = 0; pos < (32 / (1 << depth)); pos += 4) {
            array<int, 4> saved_vector;
            saved_vector[0] = input_vector[pos] + input_vector[pos+3];
            saved_vector[1] = input_vector[pos+1] + input_vector[pos+2];
            saved_vector[2] = input_vector[pos+1] - input_vector[pos+2];
            saved_vector[3] = input_vector[pos] - input_vector[pos+3];
            for (int i = 0; i < 4; i++) input_vector[pos+i] = saved_vector[i];
        }
        print_vector(input_vector, "Sums and subtractions applied");
        input_vector = t2s_back(input_vector, 32 >> depth);
        print_vector(input_vector, "T2s back applied");
        N /= 2;
    }

    return input_vector;
}

// Decomposição da DCT-II já está funcionando
// Falta implementar seleção entre as 3 transformadas
// Dúvida: esse módulo difere a DST-VII da DCT-VIII?
int main() {
    int N;
    array<int, 32> input_vector, decomposed_vector;

    cin >> N;
    for (int i = 0; i < 32; i++) cin >> input_vector[i];

    decomposed_vector = decompose(input_vector, N);

    print_vector(decomposed_vector, "Decomposed Vector");
}

# Embedding binary data into a C++ executable via two different methods.

## Generating Data
`make out/data.bin` will generate binary data using `src/datagen.cc`

## Method 1: xxd
`xxd -i [binary file] > [header file]` reads a binary file and produces a header file suitable for inclusion in C/C++.

`make out/xxduser` will produce a binary which includes `out/data.bin` through this method.

## Method 2: linked object file
`src/data.S` is a custom assembly source which includes `out/data.bin` binary data directly. It can be built into an object file using `make out/data.o`.

The object file can be inspected using `nm out/data.o`:
```
0000000000000028 D _data_end
0000000000000028 D _data_size
0000000000000000 D _data_start
```

Finally, `make out/externuser` builds and links `src/externuser.cc` with the above object file.

## Running it
`make runall` should print the following:

```
bin/externuser && bin/xxduser
0 1.1 2.2 3.3 4.4 5.5 6.6 7.7 8.8 9.9
0 1.1 2.2 3.3 4.4 5.5 6.6 7.7 8.8 9.9
```

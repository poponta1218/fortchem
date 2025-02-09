# fortchem

This is a Library about Chemistry written in Fortran.

## Prerequisites

Before building the library, ensure you have the following installed:

- **Fortran Compiler**:
    - GNU Fortran (`gfortran`)
    - Intel Fortran (`ifort`, `ifx`)
    - Flang (`flang`)
- **Build Tools**:
    - CMake (`cmake`)

## Installation

To build and install the library, follow these steps:

### Build with [fortran-lang/fpm](https://github.com/fortran-lang/fpm)

The environment variable `FPM_FC` must be set to the Fortran compiler you are using. (we only support `gfortran`, `ifort`, `ifx`, and `flang`).  
For example, if you are using `gfortran`, the command would be:

```bash
export FPM_FC=gfortran
```

1. Clone the repository

    ```bash
    git clone https:://github.com/poponta1218/fortchem.git
    cd fortchem
    ```

2. Build the library

    ```bash
    fpm build
    ```

3. Install the library

    ```bash
    fpm install --prefix=.
    ```

### Build with CMake

1. Clone the reposiory

    ```bash
    git clone https:://github.com/poponta1218/fortchem.git
    cd fortchem
    ```

2. Configure the build

    ```bash
    cmake -B build -DCMAKE_Fortran_COMPILER=<compiler>
    ```

    Replace `<compiler>` with the Fortran compiler you are using (we just support `gfortran`, `ifort`, `ifx`, and `flang`).  
    For example, if you are using `gfortran`, the command would be:

    ```bash
    cmake -B build -DCMAKE_Fortran_COMPILER=gfortran
    ```

3. Build the library

    ```bash
    cmake --build build
    ```

4. Install the library

    ```bash
    cmake --install build
    ```

## License

This project is licensed under the MIT License.  
See the [LICENSE](LICENSE) file for details.

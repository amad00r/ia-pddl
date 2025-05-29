# ia-pddl

## Ejecución de Scripts

Para ejecutar los scripts correspondientes a cada caso, utiliza los siguientes comandos en la terminal:

### Caso Básico

> **NOTA:** Ejecutar los comandos desde la carpeta de `Metric-FF`.

```bash
./ff -o ../Basico/base_domain.pddl -f ../Basico/base_problem.pddl
```

### Extensiones

- **Extensión 1**
    ```bash
    ./ff -o ../Extension_1/e1_domain.pddl -f ../Extension_1/e1_problem.pddl
    ```

- **Extensión 2**
    ```bash
    ./ff -o ../Extension_2/e2_domain.pddl -f ../Extension_2/e2_problem.pddl
    ```

- **Extensión 3**
    ```bash
    ./ff -o ../Extension_3/e3_domain.pddl -f ../Extension_3/e3_problem.pddl
    ```

- **Extensión 4**
    ```bash
    ./ff -o ../Extension_4/e4_domain.pddl -f ../Extension_4/e4_problem.pddl
    ```

- **Extensión 5**
    ```bash
    ./ff -o ../Extension_5/e5_domain.pddl -f ../Extension_5/e5_problem.pddl -O > ../Extension_5/last_result.out
    ```
    
Para parsear los resultados generados, ejecuta el siguiente comando desde otra terminal, ubicándote en la carpeta `Extension_5`:

```bash
python3 parserPrice.py
```


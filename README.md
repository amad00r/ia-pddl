# ia-pddl

## Ejecución de Scripts

Para ejecutar los scripts correspondientes a cada caso, utiliza los siguientes comandos en la terminal:

### Versión Básica

> **NOTA:** Ejecutar los comandos desde el root del proyecto.

```bash
Metric-FF/ff -o Basico/domain.pddl -f Basico/debug-problem.pddl
```

### Extensiones

- **Extensión 1**
    ```bash
    Metric-FF/ff -o Extension_1/domain.pddl -f Extension_1/debug-problem.pddl
    ```

- **Extensión 2**
    ```bash
    Metric-FF/ff -o Extension_2/domain.pddl -f Extension_2/debug-problem.pddl
    ```

- **Extensión 3**
    ```bash
    Metric-FF/ff -o Extension_3/domain.pddl -f Extension_3/debug-problem.pddl
    ```

- **Extensión 4**
    ```bash
    Metric-FF/ff -o Extension_4/domain.pddl -f Extension_4/debug-problem.pddl
    ```
    Para parsear los resultados generados:

    ```bash
    echo "$(Metric-FF/ff -o Extension_4/domain.pddl -f Extension_4/debug-problem.pddl)" | python3 Extension_4/parserCal.py Extension_4/debug-problem.pddl /dev/stdin
    ```

- **Extensión 5**
    ```bash
    Metric-FF/ff -o Extension_5/domain.pddl -f Extension_5/debug-problem.pddl -O
    ```

    Para parsear los resultados generados:

    ```bash
    echo "$(Metric-FF/ff -o Extension_5/domain.pddl -f Extension_5/debug-problem.pddl -O)" | python3 Extension_5/parserPrice.py Extension_5/debug-problem.pddl /dev/stdin
    ```

### Generar Juegos de Prueba

Para generar juegos de prueba, ejecuta el script `generador-tests.py` con el siguiente comando en la terminal:

```bash
python3 generador-tests.py
```

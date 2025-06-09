import random
import sys

PRIMEROS = [
    ("paella", "arroz", 650, 8),
    ("arroz-negro", "arroz", 600, 7),
    ("sopa-verduras", "sopa", 350, 3),
    ("gazpacho", "sopa", 250, 3.5),
    ("crema-calabaza", "crema", 400, 4),
    ("ensalada-mixta", "ensalada", 300, 4),
    ("macarrones", "pasta", 550, 5),
    ("espaguetis", "pasta", 580, 5.5),
    ("lentejas", "legumbre", 500, 4),
    ("garbanzos", "legumbre", 480, 4.5),
    ("tortilla-patatas", "huevo", 450, 4),
    ("revuelto-setas", "huevo", 420, 5),
]

SEGUNDOS = [
    ("salmon-plancha", "pescado", 700, 12),
    ("merluza-salsa", "pescado", 600, 9),
    ("bacalao-horno", "pescado", 550, 11),
    ("pollo-asado", "carne", 650, 7),
    ("filete-ternera", "carne", 800, 10),
    ("albondigas", "carne", 700, 5),
    ("pechuga-plancha", "carne", 600, 6.5),
    ("cordero-asado", "carne", 850, 15),
    ("fabada", "legumbre", 750, 6),
    ("calamar-romana", "frito", 650, 8),
    ("croquetas", "frito", 600, 6),
    ("pescadito-frito", "frito", 700, 9),
]

def generar_base(num_primeros=5, num_segundos=5):
    """Genera problema para extensión base"""
    # Seleccionar platos aleatorios
    primeros = random.sample(PRIMEROS, num_primeros)
    segundos = random.sample(SEGUNDOS, num_segundos)
    
    # Generar incompatibilidades (20-30%)
    incomp = []
    for p in primeros:
        for s in segundos:
            if random.random() < 0.25:  # 25% probabilidad
                incomp.append((p[0], s[0]))
    
    # Construir PDDL
    output = f"""(define (problem ricorico-base-generado)
  (:domain ricorico-base)
  
  (:objects
    ; Primeros platos
    {' '.join([p[0] for p in primeros])} - primero
    
    ; Segundos platos  
    {' '.join([s[0] for s in segundos])} - segundo
    
    ; Días
    lunes martes miercoles jueves viernes - dia
  )
  
  (:init
    ; Días sin menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)
    
    ; Incompatibilidades"""
    
    for p, s in incomp:
        output += f"\n    (incompatible {p} {s})"
    
    output += """
  )

  (:goal 
    (and
      (dia-asignado lunes)
      (dia-asignado martes)
      (dia-asignado miercoles)
      (dia-asignado jueves)
      (dia-asignado viernes)
    )
  )
)"""
    
    return output

def generar_ext1():
    """Genera problema para ext1 (exactamente 5 de cada)"""
    return generar_base(5, 5).replace("ricorico-base", "ricorico-ext1")

def generar_ext2_3_4_5(extension):
    """Genera problema para extensiones 2-5"""
    # Incluir paella si es ext3, ext4 o ext5
    if extension in ["ext3", "ext4", "ext5"]:
        # Asegurar que paella está incluida
        primeros = [p for p in PRIMEROS if p[0] == "paella"][:1]
        primeros += random.sample([p for p in PRIMEROS if p[0] != "paella"], 4)
    else:
        primeros = random.sample(PRIMEROS, 5)
    
    segundos = random.sample(SEGUNDOS, 5)
    
    # Tipos únicos
    tipos = list(set([p[1] for p in primeros] + [s[1] for s in segundos]))
    
    # Incompatibilidades
    incomp = []
    for p in primeros:
        for s in segundos:
            if random.random() < 0.2:
                incomp.append((p[0], s[0]))
    
    # Construir PDDL
    output = f"""(define (problem ricorico-{extension}-generado)
  (:domain ricorico-{extension})
  
  (:objects
    ; Primeros
    {' '.join([p[0] for p in primeros])} - primero
    
    ; Segundos
    {' '.join([s[0] for s in segundos])} - segundo
    
    ; Días
    lunes martes miercoles jueves viernes - dia
    
    ; Tipos
    {' '.join(tipos)} - tipo-plato
  )
  
  (:init
    ; Días sin menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)
    
    ; Orden de días
    (primer-dia lunes)
    (siguiente-dia lunes martes)
    (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves)
    (siguiente-dia jueves viernes)
    
    ; Incompatibilidades"""
    
    for p, s in incomp:
        output += f"\n    (incompatible {p} {s})"
    
    output += "\n    \n    ; Tipos de primeros"
    for p in primeros:
        output += f"\n    (es-tipo-primero {p[0]} {p[1]})"
    
    output += "\n    \n    ; Tipos de segundos"
    for s in segundos:
        output += f"\n    (es-tipo-segundo {s[0]} {s[1]})"
    
    # Para ext3+: añadir plato obligatorio
    if extension in ["ext3", "ext4", "ext5"]:
        # Elegir un día aleatorio y asignar paella
        dias = ["lunes", "martes", "miercoles", "jueves", "viernes"]
        dia_paella = random.choice(dias)
        output += f"\n    \n    ; Plato obligatorio\n    (primero-en-dia {dia_paella} paella)"
        
        # Opcionalmente, asignar otro plato obligatorio
        if random.random() < 0.5:
            otro_segundo = random.choice(segundos)
            dias_disponibles = [d for d in dias if d != dia_paella]
            dia_segundo = random.choice(dias_disponibles)
            output += f"\n    (segundo-en-dia {dia_segundo} {otro_segundo[0]})"
    
    # Para ext4 y ext5: añadir calorías
    if extension in ["ext4", "ext5"]:
        output += "\n    \n    ; Calorías"
        for p in primeros:
            output += f"\n    (= (calorias-primero {p[0]}) {p[2]})"
        for s in segundos:
            output += f"\n    (= (calorias-segundo {s[0]}) {s[2]})"
    
    # Para ext5: añadir precios
    if extension == "ext5":
        output += "\n    \n    ; Precios"
        for p in primeros:
            output += f"\n    (= (precio-primero {p[0]}) {p[3]})"
        for s in segundos:
            output += f"\n    (= (precio-segundo {s[0]}) {s[3]})"
        output += "\n    (= (total-cost) 0)"
    
    output += """
  )

  (:goal 
    (and
      (dia-asignado lunes)
      (dia-asignado martes)
      (dia-asignado miercoles)
      (dia-asignado jueves)
      (dia-asignado viernes)
    )
  )"""
    
    if extension == "ext5":
        output += "\n  \n  (:metric minimize (total-cost))"
    
    output += "\n)"
    
    return output

def generar_ext2():
    """Genera problema específico para ext2 con más control"""
    primeros = random.sample(PRIMEROS, 6)  # Más opciones para evitar bloqueos
    segundos = random.sample(SEGUNDOS, 6)
    
    # Asegurar variedad de tipos
    tipos_primeros = list(set([p[1] for p in primeros]))
    tipos_segundos = list(set([s[1] for s in segundos]))
    
    # Si no hay suficiente variedad, regenerar
    if len(tipos_primeros) < 3 or len(tipos_segundos) < 3:
        return generar_ext2()  # Recursión para regenerar
    
    tipos = list(set(tipos_primeros + tipos_segundos))
    
    # Menos incompatibilidades para ext2 (para no bloquear soluciones)
    incomp = []
    for p in primeros:
        for s in segundos:
            if random.random() < 0.15:  # Solo 15%
                incomp.append((p[0], s[0]))
    
    output = f"""(define (problem ricorico-ext2-generado)
  (:domain ricorico-ext2)
  
  (:objects
    ; Primeros (6 para más flexibilidad)
    {' '.join([p[0] for p in primeros])} - primero
    
    ; Segundos (6 para más flexibilidad)
    {' '.join([s[0] for s in segundos])} - segundo
    
    ; Días
    lunes martes miercoles jueves viernes - dia
    
    ; Tipos
    {' '.join(tipos)} - tipo-plato
  )
  
  (:init
    ; Días sin menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)
    
    ; Orden de días
    (primer-dia lunes)
    (siguiente-dia lunes martes)
    (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves)
    (siguiente-dia jueves viernes)
    
    ; Incompatibilidades (pocas para no bloquear)"""
    
    for p, s in incomp:
        output += f"\n    (incompatible {p} {s})"
    
    output += "\n    \n    ; Tipos de primeros"
    for p in primeros:
        output += f"\n    (es-tipo-primero {p[0]} {p[1]})"
    
    output += "\n    \n    ; Tipos de segundos"
    for s in segundos:
        output += f"\n    (es-tipo-segundo {s[0]} {s[1]})"
    
    output += """
  )

  (:goal 
    (and
      (dia-asignado lunes)
      (dia-asignado martes)
      (dia-asignado miercoles)
      (dia-asignado jueves)
      (dia-asignado viernes)
    )
  )
)"""
    
    return output

# PROGRAMA PRINCIPAL
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Uso: python generador_problemas.py <extension>")
        print("Extensiones: base, ext1, ext2, ext3, ext4, ext5")
        print("\nEjemplos:")
        print("  python generador_problemas.py base")
        print("  python generador_problemas.py ext3")
        sys.exit(1)
    
    extension = sys.argv[1]
    
    # Establecer semilla aleatoria si se proporciona
    if len(sys.argv) > 2:
        random.seed(int(sys.argv[2]))
        print(f"Usando semilla: {sys.argv[2]}")
    
    # Generar según extensión
    if extension == "base":
        contenido = generar_base()
    elif extension == "ext1":
        contenido = generar_ext1()
    elif extension == "ext2":
        contenido = generar_ext2()
    elif extension in ["ext3", "ext4", "ext5"]:
        contenido = generar_ext2_3_4_5(extension)
    else:
        print(f"Extension no válida: {extension}")
        print("Extensiones válidas: base, ext1, ext2, ext3, ext4, ext5")
        sys.exit(1)
    
    # Guardar archivo
    archivo = f"problem-{extension}-gen.pddl"
    with open(archivo, "w") as f:
        f.write(contenido)
    
    print(f"✓ Generado: {archivo}")
    
    # Mostrar estadísticas
    print(f"\nEstadísticas del problema generado:")
    if "primeros])} - primero" in contenido:
        num_primeros = contenido.count(" - primero")
        num_segundos = contenido.count(" - segundo")
        num_incomp = contenido.count("(incompatible ")
        print(f"  - Primeros platos: {num_primeros}")
        print(f"  - Segundos platos: {num_segundos}")
        print(f"  - Incompatibilidades: {num_incomp}")
        
        if extension in ["ext3", "ext4", "ext5"] and "(primero-en-dia" in contenido:
            num_obligatorios = contenido.count("-en-dia ")
            print(f"  - Platos obligatorios: {num_obligatorios}")
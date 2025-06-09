#!/usr/bin/env python3
"""
Generador aleatorio de problemas PDDL para la práctica RicoRico
Genera problemas con datos aleatorios para testing
"""

import random
import sys

def generar_problema_base(num_primeros=5, num_segundos=5, num_incompatibles=10):
    """Genera un problema aleatorio para el dominio base"""
    
    # Generar nombres aleatorios de platos
    primeros = [f"primero{i+1}" for i in range(num_primeros)]
    segundos = [f"segundo{i+1}" for i in range(num_segundos)]
    dias = ["lunes", "martes", "miercoles", "jueves", "viernes"]
    
    # Generar incompatibilidades aleatorias
    incompatibles = []
    for _ in range(num_incompatibles):
        p = random.choice(primeros)
        s = random.choice(segundos)
        if (p, s) not in incompatibles:
            incompatibles.append((p, s))
    
    # Construir el problema PDDL
    problema = "(define (problem ricorico-base-generado)\n"
    problema += "  (:domain ricorico-base)\n\n"
    problema += "  (:objects\n"
    problema += f"    {' '.join(primeros)} - primero\n"
    problema += f"    {' '.join(segundos)} - segundo\n"
    problema += f"    {' '.join(dias)} - dia\n"
    problema += "  )\n\n"
    problema += "  (:init\n"
    
    for dia in dias:
        problema += f"    (dia-sin-menu {dia})\n"
    
    problema += "\n"
    for p, s in incompatibles:
        problema += f"    (incompatible {p} {s})\n"
    
    problema += "  )\n\n"
    problema += "  (:goal\n"
    problema += "    (and\n"
    for dia in dias:
        problema += f"      (dia-asignado {dia})\n"
    problema += "    )\n"
    problema += "  )\n"
    problema += ")"
    
    return problema

def generar_problema_ext1():
    """Genera problema para extensión 1 (no repetir platos)"""
    # Necesitamos exactamente 5 de cada tipo
    return generar_problema_base(5, 5, random.randint(0, 10))

def generar_problema_ext2(num_primeros=6, num_segundos=6):
    """Genera problema para extensión 2 (tipos de platos)"""
    primeros = [f"primero{i+1}" for i in range(num_primeros)]
    segundos = [f"segundo{i+1}" for i in range(num_segundos)]
    dias = ["lunes", "martes", "miercoles", "jueves", "viernes"]
    tipos = ["tipo1", "tipo2", "tipo3", "tipo4"]
    
    problema = "(define (problem ricorico-ext2-generado)\n"
    problema += "  (:domain ricorico-ext2)\n\n"
    problema += "  (:objects\n"
    problema += f"    {' '.join(primeros)} - primero\n"
    problema += f"    {' '.join(segundos)} - segundo\n"
    problema += f"    {' '.join(dias)} - dia\n"
    problema += f"    {' '.join(tipos)} - tipo-plato\n"
    problema += "  )\n\n"
    problema += "  (:init\n"
    
    for dia in dias:
        problema += f"    (dia-sin-menu {dia})\n"
    
    problema += "\n    (primer-dia lunes)\n"
    for i in range(len(dias)-1):
        problema += f"    (siguiente-dia {dias[i]} {dias[i+1]})\n"
    
    problema += "\n"
    # Asignar tipos aleatorios
    for p in primeros:
        tipo = random.choice(tipos)
        problema += f"    (es-tipo-primero {p} {tipo})\n"
    
    problema += "\n"
    for s in segundos:
        tipo = random.choice(tipos)
        problema += f"    (es-tipo-segundo {s} {tipo})\n"
    
    problema += "  )\n\n"
    problema += "  (:goal\n"
    problema += "    (and\n"
    for dia in dias:
        problema += f"      (dia-asignado {dia})\n"
    problema += "    )\n"
    problema += "  )\n"
    problema += ")"
    
    return problema

def generar_problema_ext3(num_primeros=6, num_segundos=6):
    """Genera problema para extensión 3 (platos obligatorios)"""
    primeros = [f"primero{i+1}" for i in range(num_primeros)]
    segundos = [f"segundo{i+1}" for i in range(num_segundos)]
    dias = ["lunes", "martes", "miercoles", "jueves", "viernes"]
    tipos = ["tipo1", "tipo2", "tipo3", "tipo4"]
    
    # Elegir platos obligatorios aleatorios
    dia_obligatorio = random.choice(dias)
    primero_obligatorio = random.choice(primeros)
    
    problema = "(define (problem ricorico-ext3-generado)\n"
    problema += "  (:domain ricorico-ext3)\n\n"
    problema += "  (:objects\n"
    problema += f"    {' '.join(primeros)} - primero\n"
    problema += f"    {' '.join(segundos)} - segundo\n"
    problema += f"    {' '.join(dias)} - dia\n"
    problema += f"    {' '.join(tipos)} - tipo-plato\n"
    problema += "  )\n\n"
    problema += "  (:init\n"
    
    for dia in dias:
        problema += f"    (dia-sin-menu {dia})\n"
    
    problema += "\n    (primer-dia lunes)\n"
    for i in range(len(dias)-1):
        problema += f"    (siguiente-dia {dias[i]} {dias[i+1]})\n"
    
    problema += "\n"
    for p in primeros:
        tipo = random.choice(tipos)
        problema += f"    (es-tipo-primero {p} {tipo})\n"
    
    problema += "\n"
    for s in segundos:
        tipo = random.choice(tipos)
        problema += f"    (es-tipo-segundo {s} {tipo})\n"
    
    problema += f"\n    (primero-en-dia {dia_obligatorio} {primero_obligatorio})\n"
    
    problema += "  )\n\n"
    problema += "  (:goal\n"
    problema += "    (and\n"
    for dia in dias:
        problema += f"      (dia-asignado {dia})\n"
    problema += "    )\n"
    problema += "  )\n"
    problema += ")"
    
    return problema

def generar_problema_ext4(num_primeros=7, num_segundos=7):
    """Genera problema para extensión 4 (control calorías)"""
    primeros = [f"primero{i+1}" for i in range(num_primeros)]
    segundos = [f"segundo{i+1}" for i in range(num_segundos)]
    dias = ["lunes", "martes", "miercoles", "jueves", "viernes"]
    tipos = ["tipo1", "tipo2", "tipo3", "tipo4"]
    
    problema = "(define (problem ricorico-ext4-generado)\n"
    problema += "  (:domain ricorico-ext4)\n\n"
    problema += "  (:objects\n"
    problema += f"    {' '.join(primeros)} - primero\n"
    problema += f"    {' '.join(segundos)} - segundo\n"
    problema += f"    {' '.join(dias)} - dia\n"
    problema += f"    {' '.join(tipos)} - tipo-plato\n"
    problema += "  )\n\n"
    problema += "  (:init\n"
    
    for dia in dias:
        problema += f"    (dia-sin-menu {dia})\n"
    
    problema += "\n    (primer-dia lunes)\n"
    for i in range(len(dias)-1):
        problema += f"    (siguiente-dia {dias[i]} {dias[i+1]})\n"
    
    problema += "\n"
    for p in primeros:
        tipo = random.choice(tipos)
        problema += f"    (es-tipo-primero {p} {tipo})\n"
    
    problema += "\n"
    for s in segundos:
        tipo = random.choice(tipos)
        problema += f"    (es-tipo-segundo {s} {tipo})\n"
    
    # Generar calorías aleatorias
    problema += "\n"
    for p in primeros:
        calorias = random.randint(300, 700)
        problema += f"    (= (calorias-primero {p}) {calorias})\n"
    
    problema += "\n"
    for s in segundos:
        calorias = random.randint(400, 800)
        problema += f"    (= (calorias-segundo {s}) {calorias})\n"
    
    problema += "  )\n\n"
    problema += "  (:goal\n"
    problema += "    (and\n"
    for dia in dias:
        problema += f"      (dia-asignado {dia})\n"
    problema += "    )\n"
    problema += "  )\n"
    problema += ")"
    
    return problema

def generar_problema_ext5(num_primeros=8, num_segundos=8):
    """Genera problema para extensión 5 (optimización precio)"""
    primeros = [f"primero{i+1}" for i in range(num_primeros)]
    segundos = [f"segundo{i+1}" for i in range(num_segundos)]
    dias = ["lunes", "martes", "miercoles", "jueves", "viernes"]
    tipos = ["tipo1", "tipo2", "tipo3", "tipo4", "tipo5"]
    
    problema = "(define (problem ricorico-ext5-generado)\n"
    problema += "  (:domain ricorico-ext5)\n\n"
    problema += "  (:objects\n"
    problema += f"    {' '.join(primeros)} - primero\n"
    problema += f"    {' '.join(segundos)} - segundo\n"
    problema += f"    {' '.join(dias)} - dia\n"
    problema += f"    {' '.join(tipos)} - tipo-plato\n"
    problema += "  )\n\n"
    problema += "  (:init\n"
    
    for dia in dias:
        problema += f"    (dia-sin-menu {dia})\n"
    
    problema += "\n    (primer-dia lunes)\n"
    for i in range(len(dias)-1):
        problema += f"    (siguiente-dia {dias[i]} {dias[i+1]})\n"
    
    problema += "\n"
    for p in primeros:
        tipo = random.choice(tipos)
        problema += f"    (es-tipo-primero {p} {tipo})\n"
    
    problema += "\n"
    for s in segundos:
        tipo = random.choice(tipos)
        problema += f"    (es-tipo-segundo {s} {tipo})\n"
    
    # Calorías aleatorias
    problema += "\n"
    for p in primeros:
        calorias = random.randint(300, 700)
        problema += f"    (= (calorias-primero {p}) {calorias})\n"
    
    problema += "\n"
    for s in segundos:
        calorias = random.randint(400, 800)
        problema += f"    (= (calorias-segundo {s}) {calorias})\n"
    
    # Precios aleatorios
    problema += "\n"
    for p in primeros:
        precio = round(random.uniform(3.0, 10.0), 1)
        problema += f"    (= (precio-primero {p}) {precio})\n"
    
    problema += "\n"
    for s in segundos:
        precio = round(random.uniform(5.0, 15.0), 1)
        problema += f"    (= (precio-segundo {s}) {precio})\n"
    
    problema += "\n    (= (total-cost) 0)\n"
    problema += "  )\n\n"
    problema += "  (:goal\n"
    problema += "    (and\n"
    for dia in dias:
        problema += f"      (dia-asignado {dia})\n"
    problema += "    )\n"
    problema += "  )\n\n"
    problema += "  (:metric minimize (total-cost))\n"
    problema += ")"
    
    return problema

def main():
    if len(sys.argv) < 2:
        print("Uso: python generador.py <extension> [archivo_salida]")
        print("Extensiones: base, ext1, ext2, ext3, ext4, ext5")
        sys.exit(1)
    
    extension = sys.argv[1]
    
    # Generar el problema según la extensión
    if extension == "base":
        problema = generar_problema_base()
    elif extension == "ext1":
        problema = generar_problema_ext1()
    elif extension == "ext2":
        problema = generar_problema_ext2()
    elif extension == "ext3":
        problema = generar_problema_ext3()
    elif extension == "ext4":
        problema = generar_problema_ext4()
    elif extension == "ext5":
        problema = generar_problema_ext5()
    else:
        print(f"Extensión no válida: {extension}")
        sys.exit(1)
    
    # Escribir a archivo o mostrar por pantalla
    if len(sys.argv) >= 3:
        with open(sys.argv[2], 'w') as f:
            f.write(problema)
        print(f"Problema generado en: {sys.argv[2]}")
    else:
        print(problema)

if __name__ == "__main__":
    main()
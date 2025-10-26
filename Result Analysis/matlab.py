"""
IDS Model Performance Comparison
--------------------------------
This script visualizes and compares various IDS (Intrusion Detection System) models
based on key performance metrics:
    1. Detection Accuracy (%)
    2. False Positive Rate (%)
    3. Latency (ms)
    4. Throughput (packets/s)

Each graph includes labeled bars showing precise metric values for better interpretability.
"""

import matplotlib.pyplot as plt
import numpy as np

# ==============================
# Data from the research table
# ==============================
models = ['Regex-only', 'DFA-only', 'ANN-only', 'Hybrid Reference', 'Proposed H-IDS']
detection_accuracy = [78.2, 83.6, 81.2, 89.2, 93.5]
false_positive_rate = [7.8, 6.0, 12.0, 4.0, 3.2]
latency = [5.0, 2.0, 1.0, 2.0, 2.4]
throughput = [200, 500, 1000, 500, 410]

# ==============================
# Graph 1: Detection Accuracy
# ==============================
plt.figure(figsize=(8, 5))
bars = plt.bar(models, detection_accuracy, color='royalblue', alpha=0.8)
for bar, acc in zip(bars, detection_accuracy):
    plt.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.5,
             f'{acc}%', ha='center', va='bottom', fontsize=10, fontweight='bold')
plt.title('IDS Model vs Detection Accuracy (%)', fontsize=14, fontweight='bold')
plt.xlabel('IDS Model', fontsize=12)
plt.ylabel('Detection Accuracy (%)', fontsize=12)
plt.ylim(0, 100)
plt.grid(axis='y', linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()

# ==============================
# Graph 2: False Positive Rate
# ==============================
plt.figure(figsize=(8, 5))
bars = plt.bar(models, false_positive_rate, color='tomato', alpha=0.8)
for bar, rate in zip(bars, false_positive_rate):
    plt.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.2,
             f'{rate}%', ha='center', va='bottom', fontsize=10, fontweight='bold')
plt.title('IDS Model vs False Positive Rate (%)', fontsize=14, fontweight='bold')
plt.xlabel('IDS Model', fontsize=12)
plt.ylabel('False Positive Rate (%)', fontsize=12)
plt.ylim(0, max(false_positive_rate) + 3)
plt.grid(axis='y', linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()

# ==============================
# Graph 3: Latency
# ==============================
plt.figure(figsize=(8, 5))
bars = plt.bar(models, latency, color='mediumseagreen', alpha=0.8)
for bar, value in zip(bars, latency):
    plt.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.1,
             f'{value} ms', ha='center', va='bottom', fontsize=10, fontweight='bold')
plt.title('IDS Model vs Latency (ms)', fontsize=14, fontweight='bold')
plt.xlabel('IDS Model', fontsize=12)
plt.ylabel('Latency (ms)', fontsize=12)
plt.ylim(0, max(latency) + 1)
plt.grid(axis='y', linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()

# ==============================
# Graph 4: Throughput
# ==============================
plt.figure(figsize=(8, 5))
bars = plt.bar(models, throughput, color='darkorange', alpha=0.85)
for bar, value in zip(bars, throughput):
    plt.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 15,
             f'{value}', ha='center', va='bottom', fontsize=10, fontweight='bold')
plt.title('IDS Model vs Throughput (packets/s)', fontsize=14, fontweight='bold')
plt.xlabel('IDS Model', fontsize=12)
plt.ylabel('Throughput (packets/s)', fontsize=12)
plt.ylim(0, max(throughput) + 100)
plt.grid(axis='y', linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()

# ==============================
# End of Script
# ==============================
print("✅ IDS Model Comparison Graphs Generated Successfully!")

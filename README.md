# 🌊 Floating & Underwater Breakwaters

<div align="center">
  <img src="https://img.shields.io/badge/MATLAB-e2000f?style=for-the-badge&logo=mathworks&logoColor=white" alt="MATLAB" />
  <img src="https://img.shields.io/badge/LaTeX-47A141?style=for-the-badge&logo=latex&logoColor=white" alt="LaTeX" />
  <img src="https://img.shields.io/badge/Project_Management-0052CC?style=for-the-badge&logo=jira&logoColor=white" alt="Gantt & RACI" />
  <img src="https://img.shields.io/badge/Team_Leadership-FF9900?style=for-the-badge&logo=awsorganizations&logoColor=white" alt="Leadership" />
</div>

---

## 🇬🇧 English Version

### 📖 Overview
* 🎯 **Challenge:** Evaluate the hydrodynamic efficiency of floating and underwater breakwaters for a corporate partner (Terres Océanes). The goal was to provide data-backed structural recommendations for coastal protection.
* 🛠️ **Solution:** Led a 10-student engineering team to conduct physical wave basin experiments. Positioned structures (floating breakwaters, Star-blocks, X-blocks), calibrated wave probes, and developed MATLAB scripts to process and analyze the resulting wave attenuation data using Fourier transforms.
* 📈 **Impact:** Successfully presented actionable insights to the partner's CEO. Demonstrated strong technical analysis, experimental rigor, and effective team leadership using professional management tools (Gantt, RACI).

### 🧠 Experimental Methodology & Analysis
The project bridged physical scale modeling with digital signal processing.

* **Wave Basin Experiments:** Designed and executed physical tests in the SeaTech wave basin. Evaluated multiple configurations, including floating breakwaters with elastic mooring straps and submerged interlocking structures (Star-blocks, X-blocks).
* **Data Acquisition:** Calibrated an array of 5 wave probes (3 upstream, 2 downstream) to record water surface elevations, translating voltage signals into precise wave amplitudes (cm).
* **MATLAB Signal Processing:** Developed custom scripts to analyze the raw sensor data. The algorithm applies Fourier transforms to extract sine wave components and calculates reflection and transmission coefficients to quantify the structure's wave-damping efficiency.
* **Project Management:** Coordinated a 10-person team over several months. Ensured smooth execution through rigorous planning, using RACI matrices for task allocation and Gantt charts for milestone tracking.

### 💻 Code Structure
The primary analytical engine is written in MATLAB:
* `R_projet1a_test...m`: The core script that imports probe data, applies calibration coefficients, and computes incident vs. reflected wave amplitudes to determine the global reflection coefficient of the breakwater.

### 📂 Documentation & Media
* **Media:** A video demonstration (`digue.mp4`) showing the wave basin experiments in action.
* **Comprehensive Report:** A detailed technical report compiled in LaTeX (`Rapport_Terres_Océanes.pdf`), including structural analysis, experimental protocols, Gantt charts, and RACI matrices.

### ⚖️ Copyright & License
This project was conducted in partnership with Terres Océanes and SeaTech Engineering School. The experimental data, MATLAB scripts, and technical reports are subject to copyright and confidentiality constraints. They are provided here for portfolio demonstration and educational purposes only.

---
---

## 🇫🇷 Version Française

### 📖 Vue d'ensemble
* 🎯 **Défi :** Évaluer l'efficacité hydrodynamique de digues flottantes et sous-marines pour un partenaire industriel (le bureau d'études Terres Océanes). L'objectif était de fournir des recommandations structurelles basées sur des données concrètes pour la protection côtière.
* 🛠️ **Solution :** Direction d'une équipe de 10 élèves-ingénieurs pour mener des expériences physiques en bassin à houle. Positionnement des structures (digues flottantes, Star-blocks, X-blocks), étalonnage des sondes et développement de scripts MATLAB pour traiter et analyser l'atténuation des vagues via des transformées de Fourier.
* 📈 **Impact :** Présentation réussie des résultats et recommandations au PDG de l'entreprise partenaire. Démonstration d'une grande rigueur expérimentale, d'une analyse technique poussée et d'un leadership d'équipe efficace soutenu par des outils de gestion professionnels (Gantt, RACI).

### 🧠 Méthodologie Expérimentale & Analyse
Ce projet a fait le pont entre la modélisation physique à échelle réduite et le traitement numérique du signal.

* **Expériences en bassin à houle :** Conception et exécution d'essais physiques dans le bassin de SeaTech. Évaluation de multiples configurations, y compris des digues flottantes avec sangles d'amarrage élastiques et des structures sous-marines (Star-blocks, X-blocks).
* **Acquisition de données :** Étalonnage d'un réseau de 5 sondes houlométriques (3 en amont, 2 en aval) pour enregistrer les élévations de la surface de l'eau, convertissant les signaux de tension en amplitudes de vagues précises (cm).
* **Traitement du signal (MATLAB) :** Développement de scripts sur-mesure pour analyser les données brutes des capteurs. L'algorithme applique des transformées de Fourier pour extraire les composantes sinusoïdales et calcule les coefficients de réflexion et de transmission pour quantifier l'efficacité d'atténuation de la structure.
* **Gestion de Projet :** Coordination d'une équipe de 10 personnes sur plusieurs mois. Suivi rigoureux assuré par l'utilisation de matrices RACI pour la répartition des tâches et de diagrammes de Gantt pour le respect des jalons.

### 💻 Structure du Code
Le moteur d'analyse principal est écrit en MATLAB :
* `R_projet1a_test...m` : Le script central qui importe les données des sondes, applique les coefficients d'étalonnage et calcule les amplitudes des vagues incidentes et réfléchies pour déterminer le coefficient de réflexion global de la digue.

### 📂 Documentation & Médias
* **Médias :** Une vidéo de démonstration (`digue.mp4`) illustrant les expériences dans le bassin à houle.
* **Rapport Complet :** Un rapport technique détaillé rédigé en LaTeX (`Rapport_Terres_Océanes.pdf`), incluant l'analyse structurelle, les protocoles expérimentaux, les diagrammes de Gantt et les matrices RACI.

### ⚖️ Droits d'auteur & Licence
Ce projet a été mené en partenariat avec le bureau d'études Terres Océanes et l'école d'ingénieurs SeaTech. Les données expérimentales, les scripts MATLAB et les rapports techniques sont soumis à des droits d'auteur et de confidentialité. Ils sont présentés ici uniquement à des fins de démonstration de portfolio et dans un cadre éducatif.

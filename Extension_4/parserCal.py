import sys

def parse_pddl_file(file_path):
    """Parse the PDDL file to extract plate prices"""
    plate_cal = {}
    with open(file_path, 'r') as file:
        lines = file.readlines()
        
    for line in lines:
        line = line.strip()
        if '(= (calorias ' in line:
            parts = line.split()
            if len(parts) >= 4:
                plate_id = parts[2].strip(')')  
                cal = float(parts[3].strip(')'))
                plate_cal[plate_id.upper()] = cal
    
    return plate_cal

def extract_menus_from_solution(file_path):
    """Extract plate IDs (Px and Sx) from the solution text"""
    days = {'LUN': [], 'MAR': [], 'MIE': [], 'JUE': [], 'VIE': []}

    with open(file_path, 'r') as file:
        lines = file.readlines()
    
    for line in lines:
        line = line.strip()
        
        offset = 1 if "step" in line else 0

        if 'ASIGNAR_PRIMERO' in line:
            parts = line.split()
            if len(parts) >= 2:
                days[parts[3 + offset]].append(parts[2 + offset])
        elif 'ASIGNAR_SEGUNDO' in line:
            parts = line.split()
            if len(parts) >= 2:
                days[parts[3 + offset]].append(parts[2 + offset])
    
    return days

def calculate_total_cal(cal_dict, days):
    """Calculate and print the total calories for each day based on assigned plates."""
    for day, plates in days.items():
        total_cal = 0
        for plate_id in plates:
            plate_id_clean = plate_id.strip().upper()
            if plate_id_clean in cal_dict:
                total_cal += cal_dict[plate_id_clean]
            else:
                print(f"Plate {plate_id_clean} not found in the calorie list.")
        print(f"Total calories for {day}: {total_cal}")

def main():

    if len(sys.argv) != 3:
        print("Usage: python parserCal.py <problem_path> <solution_out_path>")
        sys.exit(1)

    problem_path = sys.argv[1]
    solution_out_path = sys.argv[2]
    cal_dict = parse_pddl_file(problem_path)
    menu_list = extract_menus_from_solution(solution_out_path)
    print("Plates assigned in the solution: ", cal_dict)
    print("Price list from PDDL file: ", menu_list)
    calculate_total_cal(cal_dict, menu_list)

if __name__ == "__main__":
    main()
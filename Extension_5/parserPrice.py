def parse_pddl_file(file_path):
    """Parse the PDDL file to extract plate prices"""
    plate_prices = {}
    with open(file_path, 'r') as file:
        lines = file.readlines()
        
    for line in lines:
        line = line.strip()
        if '(= (precio ' in line:
            parts = line.split()
            if len(parts) >= 4:
                plate_id = parts[2].strip(')')  # Extract p1, p2, s1, s2, etc.
                price = float(parts[3].strip(')'))
                plate_prices[plate_id.capitalize()] = price
    
    return plate_prices

def extract_plates_from_solution(file_path):
    """Extract plate IDs (Px and Sx) from the solution text"""
    paltos = []

    with open(file_path, 'r') as file:
        lines = file.readlines()
    
    for line in lines:
        line = line.strip()
        
        offset = 1 if "step" in line else 0

        if 'ASIGNAR_PRIMERO' in line:
            parts = line.split()
            if len(parts) >= 2:
                paltos.append(parts[2 + offset])  
            parts = line.split()
            if len(parts) >= 2:
                paltos.append(parts[2 + offset])  
    
    return paltos

def calculate_total_price(plate_prices, plates):
    """Calculate the total price for the given plates"""
    total_price = 0.0
    for plate in plates:
        if plate in plate_prices:
            total_price += plate_prices[plate]
        else:
            print(f"Warning: Plate {plate} not found in price list.")
    
    return total_price

def main():
    price_dict = parse_pddl_file("./e5_problem.pddl")
    plate_list = extract_plates_from_solution("./last_result.out")
    total_price = calculate_total_price(price_dict, plate_list)
    print("Plates assigned in the solution: ", plate_list)
    print("Price list from PDDL file: ", price_dict)
    print(f"Total price for the plates: {total_price:.2f} euros")

if __name__ == "__main__":
    main()
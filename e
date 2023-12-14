import csv

def main():
    with open('Sample_Data_Age.csv', 'r') as file:
        reader = csv.DictReader(file)
        data = list(reader)

    over65count = sum(1 for row in data if 'age' in row and int(row['age']) > 65)
    print(f"Number of people over the age of 65: {over65count}")

    seniors_data = [row for row in data if 'name' in row and 'age' in row and int(row['age']) >= 65]
    with open('Seniors_Data.csv', 'w', newline='') as seniors_file:
        fieldnames = ['name', 'age']
        writer = csv.DictWriter(seniors_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows({'name': row.get('name', ''), 'age': row.get('age', '')} for row in seniors_data)

    alpha_sorted_data = sorted(data, key=lambda x: x.get('name', ''))
    with open('alpha_all.csv', 'w', newline='') as alpha_file:
        fieldnames = ['name', 'age']
        writer = csv.DictWriter(alpha_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(alpha_sorted_data)

if __name__ == "__main__":
    main()
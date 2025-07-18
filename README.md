# Sikkim Pay Fixation Calculator

This repository contains a web-based calculator designed to assist Sikkim Government employees in understanding and calculating their pay fixation upon promotion, as per Rule 12 of the Sikkim Government Services (Revised Pay) Rules, 2018. It also includes functionality to determine the date of the next increment based on Rule 10.

## Table of Contents

* [About]()
* [Features]( "null")
* [How It Works]( "null")
* [Usage]( "null")
* [Pay Matrix Data]( "null")
* [Contributing]( "null")
* [License]( "null")
* [Deployment]( "null")

## About

The [Sikkim Pay Fixation Calculator](https://phuchungbhutia.github.io/payfix/) aims to simplify the complex process of pay fixation after promotion and the determination of the next increment date. It provides a user-friendly interface to input existing pay details, the new promoted level, and the date of the last appointment/promotion/upgradation, offering calculations based on the rules outlined in the Sikkim Government Services (Revised Pay) Rules, 2018.

This tool helps employees quickly estimate their revised pay and understand their next increment date, ensuring transparency and ease of understanding.

## Features

* **Rule 12 Compliance (Pay Fixation):** Accurately implements the logic for pay fixation on promotion as per Rule 12 of the Sikkim Government Services (Revised Pay) Rules, 2018.
  * **Two Fixation Options:** Supports calculation for both "date of promotion" and "date of next increment" scenarios.
* **Rule 10 Compliance (Next Increment Date):** Calculates the date of the next annual increment based on the date of appointment, promotion, or financial upgradation, following Rule 10.
* **Interactive Interface:** Simple and intuitive web interface with dropdowns for levels, input fields for basic pay and dates.
* **Validation:** Provides basic validation for input values to ensure calculations are based on valid pay matrix entries and dates.
* **Clear Results:** Displays the calculated pay and the next increment date clearly.
* **Responsive Design:** Built with Tailwind CSS for a clean and responsive layout that works well on various screen sizes.

## How It Works

The calculator uses a predefined Pay Matrix, extracted directly from the "Sikkim Government Services (Revised Pay) Rules, 2018" document.

The core logic for pay fixation and increment date determination is as follows:

### Option 1: Fixation from date of promotion (Rule 12(1))

1. **One Increment in Existing Level:** The employee's existing basic pay is first incremented by one stage within their *existing* pay level.
2. **Placement in Promoted Level:** The resulting pay (after the increment) is then located in the *promoted* pay level.
   * If an exact matching cell is found, that is the new pay.
   * If no exact match, the pay is fixed at the *immediate next higher cell* in the promoted level.

### Option 2: Fixation from date of next increment (Rule 12(2))

1. **Initial Placement on Promotion Date:** On the date of promotion, the employee is placed at a cell equal to their existing pay in the *higher* (promoted) level, *without* adding any increment. If no such cell is available, they are placed at the next higher cell in that level.
2. **Re-fixation on Next Increment Date:** On the date of their next increment, two increments are granted:
   * One annual increment in the existing level.
   * A second promotional increment in the existing level.
3. **Final Placement in Promoted Level:** The pay derived after these two increments in the existing level is then located in the *promoted* pay level.
   * If an exact matching cell is found, that is the new pay.
   * If no exact match, the pay is fixed at the *immediate next higher cell* in the promoted level.

### Date of Next Increment (Rule 10)

The calculator determines the next increment date based on the provided "Date of Appointment/Promotion/Upgradation":

* If the date falls between  **January 2nd and July 1st (inclusive)** , the next increment will be on **January 1st** of the following year.
* If the date falls between  **July 2nd and January 1st (inclusive)** , the next increment will be on **July 1st** of the following year.

## Usage

To use the calculator:

1. **Clone the repository:**
   ```
   git clone https://github.com/your-username/sikkim-payfix-calculator.git
   cd sikkim-payfix-calculator

   ```
2. **Open `index.html`:** Simply open the `index.html` file in your web browser. No server or build process is required.

Alternatively, you can access the live demo (if deployed on GitHub Pages).

## Pay Matrix Data

The `payMatrix` JavaScript object within `index.html` contains the full pay matrix data for Levels 1 to 23, as extracted from the official Sikkim Government Services (Revised Pay) Rules, 2018. This data is crucial for accurate calculations.

## Contributing

We welcome contributions to improve this calculator! If you'd like to contribute, please follow these steps:

1. **Fork the repository.**
2. **Create a new branch** for your feature or bug fix: `git checkout -b feature/your-feature-name` or `bugfix/issue-description`.
3. **Make your changes.**
4. **Commit your changes** with a clear and descriptive commit message.
5. **Push your branch** to your forked repository.
6. **Open a Pull Request** to the `main` branch of this repository.

Please ensure your code adheres to the existing style and includes relevant tests if applicable. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE](https://www.google.com/search?q=LICENSE "null") file for details.

## Deployment

This application can be easily deployed as a static website, for example, using GitHub Pages.

To deploy using GitHub Pages:

1. Ensure your `index.html` is in the root of your `main` branch.
2. In your GitHub repository settings, navigate to "Pages".
3. Under "Build and deployment", select "Deploy from a branch" and choose the `main` branch (or your preferred branch) and the `/ (root)` folder.
4. Save your changes. Your site should be live at `https://your-username.github.io/sikkim-payfix-calculator/` within a few minutes.

For automated deployment, you can use the `deploy.sh` script (requires `gh-pages` npm package if deploying from a `docs` folder or `gh-pages` branch). For simple root deployment, direct push to `main` and GitHub Pages settings are sufficient.

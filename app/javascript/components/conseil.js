const displayPlant = () => {
  const plants = document.querySelectorAll(".plant-garden");
  const plantName = document.getElementById("plant-name");
  const plantWatering = document.getElementById("plant-watering");
  const plantSunshine = document.getElementById("plant-sunshine");
  const generalAdvise = document.getElementById("general-advise");
  const specificAdvise = document.getElementById("specific-advise");
  
  plants.forEach(plant => {
    plant.addEventListener("click", (event) => {
      generalAdvise.classList.toggle("advice-display");
      specificAdvise.classList.toggle("advice-display");
      console.log(event.currentTarget);
      event.currentTarget.classList.toggle("plant-selection");

      plantName.innerHTML = event.currentTarget.dataset.plant;

      // Watering icon
      const iconsWatering = new Array(parseInt(event.currentTarget.dataset.watering, 10)).fill("");
      const iconsW = [];
      iconsWatering.forEach((iconWatering) => {
        iconsW.push("<i class='fas fa-tint'></i>");
      });
      const watering = iconsW;
      console.log(watering);
      const iWatering = "".concat(...watering);
      console.log(iWatering);

      plantWatering.innerHTML = `Arrosage ${iWatering}`;

      // Sunshine icon
      const iconsSunshine = new Array(parseInt(event.currentTarget.dataset.sunshine, 10)).fill("");
      const iconsS = [];
      iconsSunshine.forEach((iconSunshine) => {
        iconsS.push("<i class='fas fa-sun'></i>");
      });
      const sunshine = iconsS;
      const iSunshine = "".concat(...sunshine);

      plantSunshine.innerHTML = `Exposition ${iSunshine}`;
    });
  });
};

export {displayPlant}

const pointPlants = () => {
  const plants = document.querySelectorAll(".plant-garden");
  plants.forEach((plant) => {
    plant.addEventListener('mouseover', (event) => {
      event.currentTarget.classList.add('pointer');
    });
  });
};

export {pointPlants}
const displayPlant = () => {
  const plants = document.querySelectorAll(".plant-garden");
  const plantName = document.getElementById("plant-name");
  const plantImage = document.getElementById("plant-image");
  const plantWatering = document.getElementById("plant-watering");
  const plantSunshine = document.getElementById("plant-sunshine");
  const plantDescription = document.getElementById("plant-description");
  const generalAdvise = document.getElementById("general-advise");
  const specificAdvise = document.getElementById("specific-advise");
  
  plants.forEach(plant => {
    plant.addEventListener("click", (event) => {
      if (event.currentTarget === plant) {
        generalAdvise.style.display = "none";
        specificAdvise.style.display = "block";
        plants.forEach(plant => {
          plant.classList.remove("plant-selection");
        });

        event.currentTarget.classList.add("plant-selection");
        
        plantName.innerHTML = event.currentTarget.dataset.name;
        plantImage.src=`${event.currentTarget.dataset.image}`;
        plantDescription.innerHTML = `Description <br> ${event.currentTarget.dataset.description}`;
        console.log(event.currentTarget.dataset.description);
        // Watering
        const iconsWatering = new Array(parseInt(event.currentTarget.dataset.watering, 10)).fill("");
        const iconsW = [];
        iconsWatering.forEach((iconWatering) => {
          iconsW.push("<i class='fas fa-tint'></i>");
        });
        const watering = iconsW;
        const iWatering = "".concat(...watering);

        plantWatering.innerHTML = `Arrosage ${iWatering}`;

        // Sunshine
        const iconsSunshine = new Array(parseInt(event.currentTarget.dataset.sunshine, 10)).fill("");
        const iconsS = [];
        iconsSunshine.forEach((iconSunshine) => {
          iconsS.push("<i class='fas fa-sun'></i>");
        });
        const sunshine = iconsS;
        const iSunshine = "".concat(...sunshine);

        plantSunshine.innerHTML = `Exposition ${iSunshine}`;
      }
    });
  });
};

const displayBack = () => {
  const back = document.getElementById("backBtn");
  const plants = document.querySelectorAll(".plant-garden");
  const generalAdvise = document.getElementById("general-advise");
  const specificAdvise = document.getElementById("specific-advise");

  back.addEventListener("click", (event) => {
    if (event.currentTarget === back) {
      generalAdvise.style.display = "block";
      specificAdvise.style.display = "none";
      event.currentTarget.classList.remove("plant-selection");
      plants.forEach(plant => {
        plant.classList.remove("plant-selection");
      });
    }
  });
};

export {displayPlant, displayBack}

const displayPlant = () => {
  const plants = document.querySelectorAll(".plant-garden");
  const plantName = document.getElementById("plant-name");
  const plantWatering = document.getElementById("plant-watering");
  const plantSunshine = document.getElementById("plant-sunshine");
  const generalAdvise = document.getElementById("general-advise");
  const specificAdvise = document.getElementById("specific-advise");
  
  plants.forEach(plant => {
    plant.addEventListener("click", (event) => {
      generalAdvise.style.display = "none";
      plantName.innerHTML = event.currentTarget.dataset.plant;
      plantWatering.innerHTML = `Arrosage : ${event.currentTarget.dataset.watering}<i class="fas fa-tint"></i>`;
      plantSunshine.innerHTML = `Exposition : ${event.currentTarget.dataset.sunshine}<i class="fas fa-sun"></i>`;
      specificAdvise.style.display = "block";
      console.log(event.currentTarget.dataset.plant);
    });
  });
};

export {displayPlant}
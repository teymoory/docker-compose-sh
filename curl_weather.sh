#!/bin/bash
while [ true ]; do

  weather_name=$(curl -s wttr.in/Mashhad\?format=v2 | grep "Weather:" | awk -F "," '{print$1}' | awk -F ":" '{print$2}')
  weather_int=$(curl -s wttr.in/Mashhad\?format=v2 | grep "Weather:" | awk -F "," '{print$2}')
  country=$(curl -s wttr.in/Mashhad\?format=v2 | grep "Location:" | awk -F ":" '{print$2}' | awk -F "," '{print$1}')

  cat <<EOF >/usr/local/apache2/htdocs/index.html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <title>Weather</title>
  <link rel="stylesheet" href="css/bootstrap-weather.dark.min.css" />
</head>

<body>

  <section class="vh-100" style="background-color: #f5f6f7;">
    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-md-10 col-lg-8 col-xl-6">

          <div class="card bg-dark text-white" style="border-radius: 40px;">
            <div class="bg-image" style="border-radius: 35px;">
              <img src="css/draw1.webp" class="card-img" alt="weather" />
              <div class="mask" style="background-color: rgba(190, 216, 232, .5);"></div>
            </div>
            <div class="card-img-overlay text-dark p-5">
              <h4 class="mb-0">$country</h4>
              <p class="display-2 my-3">$weather_int</p>
              <h5>$weather_name</h5>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

</body>

</html>

EOF

  unset weather_name
  unset weather_int
  unset country
  sleep 3600
done

  // enlarge image on click. source of the image is ./images/original/IMAGENAME.JPG
document.querySelectorAll('img').forEach(img => {
    img.addEventListener('click', () => {
      const src = img.getAttribute('src').replace('thumbnail', 'original');
      const imgElement = document.createElement('img');
      imgElement.src = src;
      imgElement.style.width = '100%';
      imgElement.style.height = '100%';
      imgElement.style.objectFit = 'contain';
      imgElement.style.position = 'fixed';
      imgElement.style.top = '0';
      imgElement.style.left = '0';
      imgElement.style.right = '0';
      imgElement.style.bottom = '0';
      imgElement.style.zIndex = '9999';
      imgElement.style.backgroundColor = 'rgba(0, 0, 0, 0.8)';
      imgElement.style.cursor = 'zoom-out';
      imgElement.addEventListener('click', () => {
        imgElement.remove();
      });
      document.body.appendChild(imgElement);
    });
  });
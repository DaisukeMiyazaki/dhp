import os

root = os.path.dirname(os.path.abspath(__file__).partition("scripts")[0])

thumbnail_dir = f"{root}/images/thumbnail/"
html_file = f"{root}/index.html"

html_template = """<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Image Gallery</title>
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body class="bg-black p-4">
    <div class="text-center">
      <h1 class="text-center text-3xl font-bold text-white">Dream House Project</h1>
      <a href="./about.html" class="text-center text-white transition duration-300 ease-in-out hover:underline hover:scale-105">このサイトについて</a>
    </div>
    <div class="flex flex-wrap justify-center gap-4 items-start">
      %IMAGE_TAGS%
    </div>
    <a href="./about.html" class="text-center block text-white transition duration-300 ease-in-out hover:underline hover:scale-105">このサイトについて</a>
    <p class="text-center mt-4 text-gray-500">@dreamhouseproject.net</p>
  </body>
</html>
<script src="enlargeImageOnClick.js" type="text/javascript"></script>
"""

# process all images in the thumbnail directory
image_tags = ""
for filename in os.listdir(thumbnail_dir):
    name, extension = os.path.splitext(filename)
    image_tags += f"<img src=\"./images/thumbnail/{filename}\" alt=\"{name}\" class=\"w-full lg:w-1/3 h-auto rounded shadow-md\">\n"

# replace the %IMAGE_TAGS% placeholder with the actual image tags
html = html_template.replace("%IMAGE_TAGS%", image_tags)

# write the updated HTML content to the file
with open(html_file, "w") as f:
    f.write(html)

print("HTML file updated successfully!")
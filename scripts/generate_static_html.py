import os

root = os.path.dirname(os.path.abspath(__file__).partition("scripts")[0])

thumbnail_dir = f"{root}/images/thumbnail/"
html_file = f"{root}/index.html"

html_template = """<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Image Gallery</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-4">
    <h1 class="text-3xl font-bold text-center mb-4">DHP Image Gallery</h1>
  <div class="flex flex-wrap justify-center gap-4">
  %IMAGE_TAGS%
  </div>
  <p class="text-center mt-4 text-gray-500">@dreamhouseproject.net</p> 

</body>
</html>"""

# process all images in the thumbnail directory
image_tags = ""
for filename in os.listdir(thumbnail_dir):
    name, extension = os.path.splitext(filename)
    image_tags += f"<img src=\"./images/thumbnail/{filename}\" alt=\"{name}\" class=\"w-full md:w-1/2 lg:w-1/3 rounded shadow-md\">\n"

# replace the %IMAGE_TAGS% placeholder with the actual image tags
html = html_template.replace("%IMAGE_TAGS%", image_tags)

# write the updated HTML content to the file
with open(html_file, "w") as f:
    f.write(html)

print("HTML file updated successfully!")
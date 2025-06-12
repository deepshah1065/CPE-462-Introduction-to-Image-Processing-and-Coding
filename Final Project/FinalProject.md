# <p align="center"><ins> Final Project </ins></p>
## <p align="center"><ins> The Image Processing ToolBox </ins></p> 
### <p align="center"><ins> By: Connor Hsuan, Matthew Kemenosh, Miguel Rodriguez, and Deep Shah </ins></p> 
```{python}
#Libraries
from google.colab import files
import cv2
import numpy as np
import matplotlib.pyplot as plt

#Introduction to the User
print ("Welcome to the Image Processing ToolBox")
print ("By Connor Hsuan, Matthew Kemenosh, Miguel Rodriguez, and Deep Shah")

#1. Image Resizing
def Image_Resizing():
# Asking user for their inputs for which image and sizing they would like.
  uploaded = files.upload()
  filename = list(uploaded.keys())[0]
  image = cv2.imread(filename)
  info = cv2.cvtColor(image, cv2.COLOR_BGR2RGB) #COLOR_BGR2RGB converts an image from Blue, Green, and Red colors to Red, Green, and Blue colors
  #OpenCV can read Red, Green, and Blue colors
  print("Please choose a positive values that you want the width to be for the resized image")
  width = int(input("Enter Desired Width: "))
  print("Please choose a positive values that you want the height to be for the resized image")
  height = int(input("Enter Desired Height: "))

# Create the original input that the user wanted to change.
  plt.subplot(1, 2, 1)
  plt.title("Input")
  plt.imshow(info)

# Using the input by the user, change the dimensions of the image to the correct sizing.
  output = cv2.resize(info, (width, height))
  plt.subplot(1, 2, 2)
  plt.title("Output")
  plt.imshow(output)
  plt.show()

#2. Image Rotation
def Image_Rotation():
# Asking the user for their desired inputs.
  uploaded = files.upload()
  filename = list(uploaded.keys())[0]
  image = cv2.imread(filename)
  print("Please choose any angle value, it can be positive or negative")
  angle = int(input("Enter Desired Angle for Rotation: "))

# Getting basic measurements of the image and preforming the rotation.
  image_info = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
  center = (image_info.shape[1] // 2, image_info.shape[0] // 2)
  scale = 1
  rotation_matrix = cv2.getRotationMatrix2D(center, angle, scale)
  rotated_image = cv2.warpAffine(image_info, rotation_matrix, (image.shape[1], image.shape[0]))

# Creating the output for the user to be able to see their final image.
  fig, axs = plt.subplots(1, 2, figsize=(7, 4))
  axs[0].imshow(image_info)
  axs[0].set_title('Original Image')
  axs[1].imshow(rotated_image)
  axs[1].set_title('Image Rotation')
  for ax in axs:
      ax.set_xticks([])
      ax.set_yticks([])

  plt.tight_layout()
  plt.show()

#3. Image Translation
def Image_Translation():
# Asking the user for their desired inputs for the image translation.
  uploaded = files.upload()
  filename = list(uploaded.keys())[0]
  image = cv2.imread(filename)
  info = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
  width, height = info.shape[1], info.shape[0]
  print("Please choose a positive or negative values for the x axis for how you want your image to be shifted")
  x = int(input("Enter Desired X Value: "))
  print("Please choose a positive or negative values for the y axis for how you want your image to be shifted")
  y = int(input("Enter Desired Y Value: "))

# Converting the original image to the new image after the translation.
  matrix = np.array([[1, 0, x], [0, 1, y]], dtype=np.float32)
  output = cv2.warpAffine(info, matrix, (width, height))

# Outputting the desired image for the user to see the before and after.
  fig, axs = plt.subplots(1, 2, figsize=(7, 4))
  axs[0].imshow(info), axs[0].set_title('Original Image')
  axs[1].imshow(output), axs[1].set_title('Image Translation')
  for ax in axs:
      ax.set_xticks([]), ax.set_yticks([])
  plt.tight_layout()
  plt.show()

#4. Image Shearing
def Image_Shearing():
# Asking the user for their desired inputs for the image shearing.
  uploaded = files.upload()
  filename = list(uploaded.keys())[0]
  image = cv2.imread(filename)
  info = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
  width, height = info.shape[1], info.shape[0]
  print("If you choose a value that is too high, it will not and display a black screen")
  print("Please choose a positive or negative for the x value for image shearing no greater than 5")
  shearX = float(input("Enter Desired Shear X Value: "))
  print("Please choose a positive or negative values for the y value for image shearing no larger than 5")
  shearY = float(input("Enter Desired Shear Y Value: "))

# Completing the conversion of the image with the inputted values.
  matrix = np.array([[1, shearX, 0], [0, 1, shearY]], dtype=np.float32)
  output = cv2.warpAffine(info, matrix, (width, height))

# Outputting the image for the user to see.
  fig, axs = plt.subplots(1, 2, figsize=(7, 4))
  axs[0].imshow(info), axs[0].set_title('Original Image')
  axs[1].imshow(output), axs[1].set_title('Sheared Image')
  for ax in axs:
      ax.set_xticks([]), ax.set_yticks([])
  plt.tight_layout()
  plt.show()

#5. Image Normalization
def Image_Normalization():
# Asking the user for their desired inputs for the image normalization.
  uploaded = files.upload()
  filename = list(uploaded.keys())[0]
  image = cv2.imread(filename)
  info = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
  b, g, r = cv2.split(info)

# Outputting the value after applying Normalization
  print("Here Are The Values Before Applying Normalization")
  before_output = cv2.merge((b, g, r))
  print(before_output[:, :, 0])

# Completing the image normalization by changing the pixel values to a specific range.
  b_normalized = cv2.normalize(b.astype('float'), None, 0, 1, cv2.NORM_MINMAX)
  g_normalized = cv2.normalize(g.astype('float'), None, 0, 1, cv2.NORM_MINMAX)
  r_normalized = cv2.normalize(r.astype('float'), None, 0, 1, cv2.NORM_MINMAX)

# Outputting the value after applying Normalization
  print("Here Are The Values After Applying Normalization")
  after_output = cv2.merge((b_normalized, g_normalized, r_normalized))
  print(after_output[:, :, 0])

# Outputting the desired image for the user to see the before the normalization and after the normalization.
  fig, axs = plt.subplots(1, 2, figsize=(7, 4))
  axs[0].imshow(before_output), axs[0].set_title('Before Normalization')
  axs[1].imshow(after_output), axs[1].set_title('After Normalization')
  for ax in axs:
      ax.set_xticks([]), ax.set_yticks([])
  plt.tight_layout()
  plt.show()

#6. Edge Detection of Image
def Edge_Detection():
# Asking the user for their desired inputs for the image normalization.
  uploaded = files.upload()
  filename = list(uploaded.keys())[0]
  image = cv2.imread(filename)
  info = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

# Computing the Edges in the image and showcasing them for the user.
  edges = cv2.Canny(info, 100, 700)
  fig, axs = plt.subplots(1, 2, figsize=(7, 4))
  print("Here is The Output for Edge Detection for the Provided Image")
  axs[0].imshow(info), axs[0].set_title('Original Image')
  axs[1].imshow(edges), axs[1].set_title('Image Edges')

# Outputting the image for the user to see.
  for ax in axs:
      ax.set_xticks([]), ax.set_yticks([])
  plt.tight_layout()
  plt.show()

#7. Image Blur
def Image_Blur():
# Asking the user for their desired inputs for the image normalization.
  uploaded = files.upload()
  filename = list(uploaded.keys())[0]
  image = cv2.imread(filename)
  info = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
  print("Please Choose an Odd Number for the Blur Amount")
  blur_amount = int(input("Enter Desired Blur Amount: "))

# Applying the blur to the image itself.
  blurred = cv2.GaussianBlur(image, (blur_amount, blur_amount), 0)
  blurred_info = cv2.cvtColor(blurred, cv2.COLOR_BGR2RGB)

# Outputting the altered imaging for the user to see.
  fig, axs = plt.subplots(1, 2, figsize=(7, 4))
  axs[0].imshow(info), axs[0].set_title('Original Image')
  axs[1].imshow(blurred_info), axs[1].set_title('Blurred Image')
  for ax in axs:
      ax.set_xticks([]), ax.set_yticks([])
  plt.tight_layout()
  plt.show()

#8. Noise Removal
def Noise_Removal():
# Asking the user for the needed inputs.
  uploaded = files.upload()
  filename = list(uploaded.keys())[0]
  image = cv2.imread(filename)
  info = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

# Changing the blur on the image.
  output = cv2.medianBlur(info, 11)

# Outputting for the user to be able to see the final image processing.
  plt.subplot(1, 2, 1)
  plt.title("Original")
  plt.imshow(info)
  plt.subplot(1, 2, 2)
  plt.title("Noise Removal")
  plt.imshow(output)
  plt.show()

#9. Brightness and Contrast
def Brightness_Contrast():
# Asking the user for the needed inputs.
  uploaded = files.upload()
  filename = list(uploaded.keys())[0]
  image = cv2.imread(filename)
  info = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
  print("Please choose positive or negative for values for Brightness")
  beta = int(input("Enter Desired Brightness: "))
  print("Please choose positive for values for Contrast that is greater than 1")
  alpha = int(input("Enter Desired Contrast: "))

# Changing the brightness and the contrast of the image.
  output = cv2.convertScaleAbs(info, alpha=alpha, beta=beta)

# Outputting the image for the user to see.
  fig, axs = plt.subplots(1, 2, figsize=(7, 4))
  axs[0].imshow(info), axs[0].set_title('Original Image')
  axs[1].imshow(output), axs[1].set_title('Brightness and Contrast Image')
  for ax in axs:
      ax.set_xticks([]), ax.set_yticks([])
  plt.tight_layout()
  plt.show()

#10. Color Enhancement
def Color_Enhancement():
# Asking the user for the desired inputs.
  uploaded = files.upload()
  filename = list(uploaded.keys())[0]
  image = cv2.imread(filename)
  info = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

# Enchanging the colors in the image.
  image = cv2.cvtColor(image, cv2.COLOR_RGB2HSV)
  image[:, :, 0] = image[:, :, 0] * 0.7
  image[:, :, 1] = image[:, :, 1] * 1.5
  image[:, :, 2] = image[:, :, 2] * 0.5
  output = cv2.cvtColor(info, cv2.COLOR_HSV2BGR)

# Plotting the image for the user to see.
  plt.subplot(1, 2, 1)
  plt.title("Original")
  plt.imshow(info)
  plt.subplot(1, 2, 2)
  plt.title("Altered Color")
  plt.imshow(output)
  plt.show()

while True:
  print ("Please select a process that you would like to use to process your image")
  print ("1. Image Resizing")
  print ("2. Image Rotation")
  print ("3. Image Translation")
  print ("4. Image Shearing")
  print ("5. Image Normalization")
  print ("6. Edge Detection of Image")
  print ("7. Image Blur")
  print ("8. Noise Removal")
  print ("9. Brightness and Contrast")
  print ("10. Color Enhancement")
  print ("11. Exit")

  try:
    Answer = int(input("Please enter your answer: "))
    if Answer == 11:
      print("Thank you for using the Image Processing ToolBox!")
      break
    else:
      switch = {
        1: Image_Resizing,
        2: Image_Rotation,
        3: Image_Translation,
        4: Image_Shearing,
        5: Image_Normalization,
        6: Edge_Detection,
        7: Image_Blur,
        8: Noise_Removal,
        9: Brightness_Contrast,
        10:Color_Enhancement,
}
    switch.get(Answer)()
  except:
    print("Invalid Input")
```

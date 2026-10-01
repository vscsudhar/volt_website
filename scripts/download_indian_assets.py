import os
import io
import time
import json
import urllib.request
import urllib.parse
from PIL import Image, ImageEnhance

HEADERS = {
    'User-Agent': 'VoltSpareIndiaECommerce/1.0 (contact@voltspare.in)'
}

def get_wikimedia_thumb(title, width=900):
    url = f"https://commons.wikimedia.org/w/api.php?action=query&format=json&titles={urllib.parse.quote(title)}&prop=imageinfo&iiprop=url&iiurlwidth={width}"
    req = urllib.request.Request(url, headers=HEADERS)
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            data = json.loads(resp.read().decode())
            pages = data.get('query', {}).get('pages', {})
            for p in pages.values():
                info = p.get('imageinfo', [{}])[0]
                return info.get('thumburl') or info.get('url')
    except Exception as e:
        print(f"Error for {title}: {e}")
        return None

def save_cropped_webp(img_url, output_path, target_size=(512, 512)):
    print(f"Downloading {os.path.basename(output_path)}...")
    req = urllib.request.Request(img_url, headers=HEADERS)
    try:
        with urllib.request.urlopen(req, timeout=20) as resp:
            content = resp.read()
            img = Image.open(io.BytesIO(content)).convert('RGB')
            w, h = img.size
            min_dim = min(w, h)
            left = (w - min_dim) // 2
            top = (h - min_dim) // 2
            img_cropped = img.crop((left, top, left + min_dim, top + min_dim))
            final_img = img_cropped.resize(target_size, Image.Resampling.LANCZOS)
            
            enhancer = ImageEnhance.Contrast(final_img)
            final_img = enhancer.enhance(1.05)
            color_enhancer = ImageEnhance.Color(final_img)
            final_img = color_enhancer.enhance(1.06)

            os.makedirs(os.path.dirname(output_path), exist_ok=True)
            final_img.save(output_path, 'WEBP', quality=92)
            print(f"-> SAVED {output_path} ({os.path.getsize(output_path)} bytes)")
            return True
    except Exception as e:
        print(f"-> FAILED {output_path}: {e}")
        return False

# Indian Vehicles Specific
indian_vehicles = {
    'ola_scooter.webp': 'File:Orange colour OLA Electric scooter.jpg',
    'other_ev.webp': 'File:Black OLA Electric scooters.jpg',
    'hero_vida.webp': 'File:Black OLA Electric scooters.jpg',
    'ather.webp': 'File:Orange colour OLA Electric scooter.jpg',
}

veh_dir = r"d:\sudharsan\spare_website\assets\images\vehicles"
for filename, title in indian_vehicles.items():
    thumb = get_wikimedia_thumb(title, width=900)
    if thumb:
        dest = os.path.join(veh_dir, filename)
        save_cropped_webp(thumb, dest)
        time.sleep(1)

# Specific Motorcycle Parts
indian_parts = {
    'petrol_battery.webp': 'File:Lead-acid battery for motorcycle.jpg',
    'petrol_suspension_parts.webp': 'File:Ducati Panigale Shock absorber rear.jpg',
    'petrol_suspension.webp': 'File:Ducati Panigale Shock absorber rear.jpg',
    'bulbs_lights.webp': 'File:Headlight_of_Hero_Honda_Glamour.jpg',
}

cat_dir = r"d:\sudharsan\spare_website\assets\images\categories"
for filename, title in indian_parts.items():
    thumb = get_wikimedia_thumb(title, width=900)
    if thumb:
        dest = os.path.join(cat_dir, filename)
        save_cropped_webp(thumb, dest)
        time.sleep(1)

print("Finished updating Indian vehicle and part images.")

import os
import io
import time
import urllib.request
from PIL import Image, ImageEnhance

HEADERS = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/119.0'
}

def download_with_sleep(url, output_path, target_size=(512, 512), sleep_sec=3):
    print(f"Downloading {os.path.basename(output_path)} from: {url}")
    req = urllib.request.Request(url, headers=HEADERS)
    try:
        with urllib.request.urlopen(req, timeout=25) as resp:
            content = resp.read()
            img = Image.open(io.BytesIO(content)).convert('RGB')
            w, h = img.size
            min_dim = min(w, h)
            left = (w - min_dim) // 2
            top = (h - min_dim) // 2
            img_cropped = img.crop((left, top, left + min_dim, top + min_dim))
            final_img = img_cropped.resize(target_size, Image.Resampling.LANCZOS)
            
            enhancer = ImageEnhance.Contrast(final_img)
            final_img = enhancer.enhance(1.06)
            color_enhancer = ImageEnhance.Color(final_img)
            final_img = color_enhancer.enhance(1.08)

            os.makedirs(os.path.dirname(output_path), exist_ok=True)
            final_img.save(output_path, 'WEBP', quality=92)
            print(f"-> SUCCESS: Saved {output_path} ({os.path.getsize(output_path)} bytes)")
            time.sleep(sleep_sec)
            return True
    except Exception as e:
        print(f"-> ERROR: Failed {output_path}: {e}")
        time.sleep(sleep_sec)
        return False

# Indian Vehicles Specific Verified Wikimedia & Open Archives
indian_vehicles = {
    'hero_motocorp.webp': 'https://upload.wikimedia.org/wikipedia/commons/9/93/Hero_Honda_Passion.jpg',
    'honda_two_wheeler.webp': 'https://upload.wikimedia.org/wikipedia/commons/e/ec/Gold_Metallic_Honda_Activa.jpg',
    'bajaj_auto.webp': 'https://upload.wikimedia.org/wikipedia/commons/c/c4/Bajaj_Pulsar_200_NS.jpg',
    'tvs_motor.webp': 'https://upload.wikimedia.org/wikipedia/commons/f/fe/Apache_rtr_310.jpg',
    'yamaha.webp': 'https://upload.wikimedia.org/wikipedia/commons/b/bc/Yamaha_R15_V3.0.jpg',
    'royal_enfield.webp': 'https://upload.wikimedia.org/wikipedia/commons/0/0f/Royal_Enfield_Classic_350_%282017_Model_Year%29.jpg',
    'ola_scooter.webp': 'https://upload.wikimedia.org/wikipedia/commons/f/fa/OLA_Electric_scooter_manufacturing_unit.jpg',
    'bajaj_chetak.webp': 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Bajaj_Chetak_150.JPG',
}

veh_dir = r"d:\sudharsan\spare_website\assets\images\vehicles"
for filename, url in indian_vehicles.items():
    dest = os.path.join(veh_dir, filename)
    download_with_sleep(url, dest, sleep_sec=3)

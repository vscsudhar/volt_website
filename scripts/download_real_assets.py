import os
import io
import urllib.request
from PIL import Image, ImageEnhance

HEADERS = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
}

def download_and_format_image(url, output_path, target_size=(512, 512)):
    print(f"Processing {os.path.basename(output_path)}...")
    req = urllib.request.Request(url, headers=HEADERS)
    try:
        with urllib.request.urlopen(req, timeout=25) as resp:
            content = resp.read()
            img = Image.open(io.BytesIO(content)).convert('RGB')
            
            w, h = img.size
            
            # Center crop to square
            min_dim = min(w, h)
            left = (w - min_dim) // 2
            top = (h - min_dim) // 2
            img_cropped = img.crop((left, top, left + min_dim, top + min_dim))
            
            final_img = img_cropped.resize(target_size, Image.Resampling.LANCZOS)
            
            # Enhance clarity
            enhancer = ImageEnhance.Contrast(final_img)
            final_img = enhancer.enhance(1.05)
            color_enhancer = ImageEnhance.Color(final_img)
            final_img = color_enhancer.enhance(1.08)

            os.makedirs(os.path.dirname(output_path), exist_ok=True)
            final_img.save(output_path, 'WEBP', quality=92)
            print(f"-> Saved {output_path} ({os.path.getsize(output_path)} bytes, size={final_img.size})")
            return True
    except Exception as e:
        print(f"FAILED {output_path}: {e}")
        return False

brain_dir = r"C:\Users\user\.gemini\antigravity-ide\brain\aa7929db-339c-486f-be6f-86ef20e01fe5"
cat_dir = r"d:\sudharsan\spare_website\assets\images\categories"
veh_dir = r"d:\sudharsan\spare_website\assets\images\vehicles"
feat_dir = r"d:\sudharsan\spare_website\assets\images\features"

# 1. EV Categories from High-End 3D Renders
ev_map = {
    'brake_pads.webp': 'ev_brake_pads_1790765063679.jpg',
    'brake_cables.webp': 'ev_brake_cables_1790765080915.jpg',
    'tyres.webp': 'ev_tyres_1790765097464.jpg',
    'ev_electrical_parts.webp': 'ev_electrical_1790765114355.jpg',
    'ev_electrical.webp': 'ev_electrical_1790765114355.jpg',
    'sensors.webp': 'ev_sensors_1790765177974.jpg',
    'ev_suspension_parts.webp': 'ev_suspension_1790765192170.jpg',
    'suspension_parts.webp': 'ev_suspension_1790765192170.jpg',
    'ev_charging_parts.webp': 'ev_charging_1790765205242.jpg',
    'ev_charging.webp': 'ev_charging_1790765205242.jpg',
    'cable_throttle.webp': 'cable_throttle_1790765223787.jpg',
    'seat_lock.webp': 'seat_lock_1790765250051.jpg',
    'clutch_cable.webp': 'clutch_cable_1790765262121.jpg',
    'ev_accessories.webp': 'ev_accessories_1790765274620.jpg',
    'ev_battery.webp': 'ev_battery_1790765291145.jpg',
    'other_ev_parts.webp': 'other_ev_parts_1790765321298.jpg',
}

print("=== 1. EV Categories ===")
for dest_name, src_name in ev_map.items():
    src_path = os.path.join(brain_dir, src_name)
    dest_path = os.path.join(cat_dir, dest_name)
    if os.path.exists(src_path):
        img = Image.open(src_path).convert('RGB')
        w, h = img.size
        min_dim = min(w, h)
        left = (w - min_dim) // 2
        top = (h - min_dim) // 2
        img_cropped = img.crop((left, top, left + min_dim, top + min_dim))
        final_img = img_cropped.resize((512, 512), Image.Resampling.LANCZOS)
        final_img.save(dest_path, 'WEBP', quality=92)
        print(f"Saved EV 3D render {dest_name}: {os.path.getsize(dest_path)} bytes")

# 2. Petrol Categories (High-Res Realistic Product Images)
petrol_urls = {
    'engine_oil.webp': 'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?auto=format&fit=crop&w=800&q=80',
    'petrol_brake_parts.webp': 'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?auto=format&fit=crop&w=800&q=80',
    'petrol_brake_pads.webp': 'https://images.unsplash.com/photo-1600705722908-bab1e61c0b4d?auto=format&fit=crop&w=800&q=80',
    'petrol_brake_cables.webp': 'https://images.unsplash.com/photo-1544816155-12df9643f363?auto=format&fit=crop&w=800&q=80',
    'air_filters.webp': 'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?auto=format&fit=crop&w=800&q=80',
    'oil_filters.webp': 'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?auto=format&fit=crop&w=800&q=80',
    'spark_plugs.webp': 'https://images.unsplash.com/photo-1599819811279-d5ad9cccf838?auto=format&fit=crop&w=800&q=80',
    'chain_sprocket.webp': 'https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?auto=format&fit=crop&w=800&q=80',
    'petrol_electrical_parts.webp': 'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=800&q=80',
    'petrol_electrical.webp': 'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=800&q=80',
    'bulbs_lights.webp': 'https://images.unsplash.com/photo-1508974239320-0a029497e820?auto=format&fit=crop&w=800&q=80',
    'petrol_suspension_parts.webp': 'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?auto=format&fit=crop&w=800&q=80',
    'petrol_suspension.webp': 'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?auto=format&fit=crop&w=800&q=80',
    'petrol_battery.webp': 'https://images.unsplash.com/photo-1581092160607-ee22621dd758?auto=format&fit=crop&w=800&q=80',
    'petrol_accessories.webp': 'https://images.unsplash.com/photo-1558981806-ec527fa84c39?auto=format&fit=crop&w=800&q=80',
}

print("\n=== 2. Petrol Categories ===")
for filename, url in petrol_urls.items():
    dest = os.path.join(cat_dir, filename)
    download_and_format_image(url, dest)

# 3. Vehicle Images
veh_urls = {
    'ola_scooter.webp': 'https://images.unsplash.com/photo-1597733336794-12d05021d510?auto=format&fit=crop&w=800&q=80',
    'ather.webp': 'https://images.unsplash.com/photo-1609630875171-b1321377ee65?auto=format&fit=crop&w=800&q=80',
    'hero_vida.webp': 'https://images.unsplash.com/photo-1597733336794-12d05021d510?auto=format&fit=crop&w=800&q=80',
    'bajaj_chetak.webp': 'https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?auto=format&fit=crop&w=800&q=80',
    'other_ev.webp': 'https://images.unsplash.com/photo-1609630875171-b1321377ee65?auto=format&fit=crop&w=800&q=80',
    'hero_motocorp.webp': 'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?auto=format&fit=crop&w=800&q=80',
    'honda_two_wheeler.webp': 'https://images.unsplash.com/photo-1558980664-769d59546b3d?auto=format&fit=crop&w=800&q=80',
    'bajaj_auto.webp': 'https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?auto=format&fit=crop&w=800&q=80',
    'tvs_motor.webp': 'https://images.unsplash.com/photo-1558981285-6f0c94958bb6?auto=format&fit=crop&w=800&q=80',
    'yamaha.webp': 'https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?auto=format&fit=crop&w=800&q=80',
    'royal_enfield.webp': 'https://images.unsplash.com/photo-1558981420-87aa9dad1c89?auto=format&fit=crop&w=800&q=80',
}

print("\n=== 3. Vehicle Images ===")
for filename, url in veh_urls.items():
    dest = os.path.join(veh_dir, filename)
    download_and_format_image(url, dest)

# 4. Feature Images
feat_urls = {
    'wide_spare_parts.webp': 'https://images.unsplash.com/photo-1581092160607-ee22621dd758?auto=format&fit=crop&w=800&q=80',
    'vehicle_compatibility.webp': 'https://images.unsplash.com/photo-1580273916550-e323be2ae537?auto=format&fit=crop&w=800&q=80',
    'same_day_delivery.webp': 'https://images.unsplash.com/photo-1617347454431-f49d7ff5c3b1?auto=format&fit=crop&w=800&q=80',
    'support.webp': 'https://images.unsplash.com/photo-1534536281715-e28d76689b4d?auto=format&fit=crop&w=800&q=80',
    'free_shipping.webp': 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?auto=format&fit=crop&w=800&q=80',
    'local_service.webp': 'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?auto=format&fit=crop&w=800&q=80',
}

print("\n=== 4. Feature Images ===")
for filename, url in feat_urls.items():
    dest = os.path.join(feat_dir, filename)
    download_and_format_image(url, dest)

print("\nAll assets processed successfully!")

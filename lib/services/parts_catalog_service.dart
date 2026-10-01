import 'package:flutter/material.dart';
import 'package:spare_website/models/brand.dart';
import 'package:spare_website/models/category.dart';

class PartsCatalogService {
  static const List<SpareCategory> evCategories = [
    SpareCategory(
      id: 'ev-brake-pads',
      name: 'Brake Pads',
      type: PartType.ev,
      description:
          'High-performance ceramic & metallic disc brake pads engineered for EV regenerative braking systems.',
      icon: Icons.disc_full_rounded,
      image: 'assets/images/categories/brake_pads.webp',
      popularParts: [
        'Disc Brake Pads',
        'Regen Ceramic Pads',
        'Front Caliper Pads',
        'Rear Brake Pads'
      ],
    ),
    SpareCategory(
      id: 'ev-brake-cables',
      name: 'Brake Cables',
      type: PartType.ev,
      description:
          'High-tensile stainless steel inner core cables with low-friction Teflon liner for instant lever response.',
      icon: Icons.linear_scale_rounded,
      image: 'assets/images/categories/brake_cables.webp',
      popularParts: [
        'Rear Drum Cable',
        'Front Brake Wire',
        'Combi Brake Cable',
        'Cable Adjusters'
      ],
    ),
    SpareCategory(
      id: 'ev-tyres',
      name: 'Tyres',
      type: PartType.ev,
      description:
          'Low rolling-resistance tubeless tyres designed to optimize battery range and handle high electric torque.',
      icon: Icons.album_rounded,
      image: 'assets/images/categories/tyres.webp',
      popularParts: [
        '90/90-12 Tubeless',
        '100/80-12 Rear Tyre',
        'Puncture Resistant Tubes',
        'Tyre Valves'
      ],
    ),
    SpareCategory(
      id: 'ev-electrical-parts',
      name: 'EV Electrical Parts',
      type: PartType.ev,
      description:
          'Waterproof DC-DC converters, OEM wiring harnesses, master switch relays and protective fuse kits.',
      icon: Icons.electric_bolt_rounded,
      image: 'assets/images/categories/ev_electrical_parts.webp',
      popularParts: [
        'DC-DC Step Down Converter',
        'Main Wiring Loom',
        'Power Relays',
        'Ignition Switch Kit'
      ],
    ),
    SpareCategory(
      id: 'ev-sensors',
      name: 'Sensors',
      type: PartType.ev,
      description:
          'High-precision Hall-effect throttle sensors, wheel speed sensors, and thermal cut-off sensor assemblies.',
      icon: Icons.sensors_rounded,
      image: 'assets/images/categories/sensors.webp',
      popularParts: [
        'Throttle Hall Sensor',
        'Wheel Speed Sensor',
        'Side Stand Cutoff Sensor',
        'Brake Light Sensor'
      ],
    ),
    SpareCategory(
      id: 'ev-suspension-parts',
      name: 'EV Suspension Parts',
      type: PartType.ev,
      description:
          'Front telescopic fork oil seals, dust boots, progressive rear mono-shocks and suspension bushes.',
      icon: Icons.swap_vert_circle_rounded,
      image: 'assets/images/categories/ev_suspension_parts.webp',
      popularParts: [
        'Front Fork Oil Seals',
        'Rear Mono Shock Absorber',
        'Swingarm Bush Kit',
        'Fork Springs'
      ],
    ),
    SpareCategory(
      id: 'ev-charging-parts',
      name: 'EV Charging Parts',
      type: PartType.ev,
      description:
          'All-weather charge port rubber flaps, dust caps, charging connector plugs and port mounting frames.',
      icon: Icons.ev_station_rounded,
      image: 'assets/images/categories/ev_charging_parts.webp',
      popularParts: [
        'Weatherproof Port Cap',
        'Charging Socket Assembly',
        'Port Latch Lock',
        'Portable Charger Cable'
      ],
    ),
    SpareCategory(
      id: 'ev-cable-throttle',
      name: 'Cable Throttle',
      type: PartType.ev,
      description:
          'Electronic twist throttle grips with integrated accelerator control wire and handlebar sleeves.',
      icon: Icons.speed_rounded,
      image: 'assets/images/categories/cable_throttle.webp',
      popularParts: [
        'E-Throttle Grip Assembly',
        'Throttle Return Spring',
        'Accelerator Wire',
        'Grip Rubber Set'
      ],
    ),
    SpareCategory(
      id: 'ev-seat-lock',
      name: 'Seat Lock',
      type: PartType.ev,
      description:
          'Mechanical seat latch mechanisms, release cables, boot lock cylinders, and helmet hook assemblies.',
      icon: Icons.lock_outline_rounded,
      image: 'assets/images/categories/seat_lock.webp',
      popularParts: [
        'Seat Latch Mechanism',
        'Seat Lock Cable',
        'Key Lock Cylinder',
        'Boot Catch Bracket'
      ],
    ),
    SpareCategory(
      id: 'ev-clutch-cable',
      name: 'Clutch Cable',
      type: PartType.ev,
      description:
          'Heavy-duty control cables with Teflon inner lining for electric motorcycles and hybrid two-wheelers.',
      icon: Icons.cable_rounded,
      image: 'assets/images/categories/clutch_cable.webp',
      popularParts: [
        'Control Cable Assembly',
        'Clutch Wire Kit',
        'Adjustment Barrel',
        'Cable Dust Boots'
      ],
    ),
    SpareCategory(
      id: 'ev-accessories',
      name: 'EV Accessories',
      type: PartType.ev,
      description:
          'Heavy waterproof scooter body covers, scratch-guard screen films, cushioned seat covers, and rubber floor mats.',
      icon: Icons.backpack_rounded,
      image: 'assets/images/categories/ev_accessories.webp',
      popularParts: [
        'All-Weather Body Cover',
        'TFT Display Screen Guard',
        'Rubber Floor Mat',
        'Padded Seat Cover'
      ],
    ),
    SpareCategory(
      id: 'ev-battery',
      name: 'EV Battery',
      type: PartType.ev,
      description:
          'High-density Lithium-ion auxiliary and main traction battery modules, connectors, and BMS accessories.',
      icon: Icons.battery_charging_full_rounded,
      image: 'assets/images/categories/ev_battery.webp',
      popularParts: [
        'Auxiliary 12V EV Battery',
        'Main Battery Connectors',
        'BMS Communication Cable',
        'Thermal Pad Kit'
      ],
    ),
    SpareCategory(
      id: 'ev-other-parts',
      name: 'Other EV Spare Parts',
      type: PartType.ev,
      description:
          'Smart motor controllers, auxiliary hardware, specialized fasteners, and EV body trim accessories.',
      icon: Icons.category_rounded,
      image: 'assets/images/categories/other_ev_parts.webp',
      popularParts: [
        'BLDC Motor Controller',
        'Relay Switch Modules',
        'Mounting Brackets',
        'Hardware Fastener Kit'
      ],
    ),
  ];

  static const List<SpareCategory> petrolCategories = [
    SpareCategory(
      id: 'petrol-engine-oil',
      name: 'Engine Oil',
      type: PartType.petrol,
      description:
          'Premium 100% Synthetic and Semi-Synthetic 4T 10W-30 / 10W-40 lubricants from Motul, Castrol, and Shell.',
      icon: Icons.water_drop_rounded,
      image: 'assets/images/categories/engine_oil.webp',
      popularParts: [
        '4T 10W-30 Synthetic',
        '4T 10W-40 Ester Oil',
        'CVT Gearbox Oil',
        'Chain Lube Spray'
      ],
    ),
    SpareCategory(
      id: 'petrol-brake-parts',
      name: 'Petrol Bike Brake Parts',
      type: PartType.petrol,
      description:
          'Stainless steel disc brake rotors, hydraulic calipers, master cylinder rebuild kits and DOT4 brake fluid.',
      icon: Icons.disc_full_rounded,
      image: 'assets/images/categories/petrol_brake_parts.webp',
      popularParts: [
        'Front Disc Rotor',
        'Brake Caliper Assembly',
        'Master Cylinder Rebuild Kit',
        'Brake Hose Pipe'
      ],
    ),
    SpareCategory(
      id: 'petrol-brake-pads',
      name: 'Petrol Bike Brake Pads',
      type: PartType.petrol,
      description:
          'Asbestos-free drum brake shoes with return springs and metallic disc brake pads for consistent stopping power.',
      icon: Icons.album_outlined,
      image: 'assets/images/categories/petrol_brake_pads.webp',
      popularParts: [
        'Drum Brake Shoes',
        'Front Disc Pads',
        'Ceramic Brake Pads',
        'Shoe Return Springs'
      ],
    ),
    SpareCategory(
      id: 'petrol-brake-cables',
      name: 'Petrol Bike Brake Cables',
      type: PartType.petrol,
      description:
          'Heavy-duty front and rear drum brake cables with metal adjusters, barrel nipples, and tension springs.',
      icon: Icons.linear_scale_rounded,
      image: 'assets/images/categories/petrol_brake_cables.webp',
      popularParts: [
        'Front Drum Brake Cable',
        'Rear Brake Cable',
        'Combi Brake Wire',
        'Cable Adjuster Screws'
      ],
    ),
    SpareCategory(
      id: 'petrol-air-filters',
      name: 'Air Filters',
      type: PartType.petrol,
      description:
          'High-flow dual-layer foam and pleated paper air filter elements designed for high dust filtration and fuel efficiency.',
      icon: Icons.filter_alt_rounded,
      image: 'assets/images/categories/air_filters.webp',
      popularParts: [
        'Foam Air Filter Element',
        'Paper Cartridge Filter',
        'Filter Box Gasket',
        'Intake Snorkel'
      ],
    ),
    SpareCategory(
      id: 'petrol-oil-filters',
      name: 'Oil Filters',
      type: PartType.petrol,
      description:
          'Micron-level filtration paper cartridges capturing minute metallic wear particles to extend engine life.',
      icon: Icons.grain_rounded,
      image: 'assets/images/categories/oil_filters.webp',
      popularParts: [
        'Spin-On Oil Filter',
        'Internal Paper Filter',
        'Filter O-Ring Seal',
        'Magnetic Drain Plug'
      ],
    ),
    SpareCategory(
      id: 'petrol-spark-plugs',
      name: 'Spark Plugs',
      type: PartType.petrol,
      description:
          'Standard copper-core and high-performance laser Iridium spark plugs for clean combustion and instant cold starts.',
      icon: Icons.flash_on_rounded,
      image: 'assets/images/categories/spark_plugs.webp',
      popularParts: [
        'NGK Standard Plug',
        'Champion Copper Plus',
        'Laser Iridium Spark Plug',
        'Spark Plug Cap'
      ],
    ),
    SpareCategory(
      id: 'petrol-chain-sprocket',
      name: 'Chain and Sprocket',
      type: PartType.petrol,
      description:
          'O-Ring and X-Ring sealed drive chain sets with induction-hardened front and rear steel sprockets.',
      icon: Icons.settings_suggest_rounded,
      image: 'assets/images/categories/chain_sprocket.webp',
      popularParts: [
        'Drive Chain (428 / 520)',
        'Front Sprocket (14T/15T)',
        'Rear Sprocket (42T-45T)',
        'Chain Lock Link'
      ],
    ),
    SpareCategory(
      id: 'petrol-electrical-parts',
      name: 'Petrol Bike Electrical Parts',
      type: PartType.petrol,
      description:
          'Ignition coils, CDI units, starter relays, stator coils, flasher units, and heavy-duty dual horns.',
      icon: Icons.electrical_services_rounded,
      image: 'assets/images/categories/petrol_electrical_parts.webp',
      popularParts: [
        'Starter Motor Relay',
        'Ignition Coil Assembly',
        'CDI / ECU Unit',
        'Handlebar Switch Gear'
      ],
    ),
    SpareCategory(
      id: 'petrol-bulbs-lights',
      name: 'Bulbs and Lights',
      type: PartType.petrol,
      description:
          'HS1 / H4 Halogen headlight bulbs, 6000K LED upgrades, indicator bulbs, and brake light bulbs.',
      icon: Icons.lightbulb_outline_rounded,
      image: 'assets/images/categories/bulbs_lights.webp',
      popularParts: [
        'HS1 35/35W Halogen Bulb',
        'H4 LED White Light',
        'Amber Indicator Bulbs',
        'Red Tail Lamp Bulb'
      ],
    ),
    SpareCategory(
      id: 'petrol-suspension-parts',
      name: 'Petrol Bike Suspension Parts',
      type: PartType.petrol,
      description:
          'Telescopic front fork oil, damper rod bushes, fork seals, and adjustable twin rear shock absorbers.',
      icon: Icons.swap_vert_rounded,
      image: 'assets/images/categories/petrol_suspension_parts.webp',
      popularParts: [
        'Fork Oil 175ml Bottle',
        'Hydraulic Rear Shocks',
        'Fork Dust Caps',
        'Steering Head Races'
      ],
    ),
    SpareCategory(
      id: 'petrol-battery',
      name: 'Petrol Bike Battery',
      type: PartType.petrol,
      description:
          '12V Maintenance-Free AGM motorcycle batteries with high cranking power from Exide and Amaron.',
      icon: Icons.battery_charging_full_rounded,
      image: 'assets/images/categories/petrol_battery.webp',
      popularParts: [
        '12V 2.5Ah Battery',
        '12V 5Ah Starter Battery',
        '12V 9Ah Cruiser Battery',
        'Terminal Connectors'
      ],
    ),
    SpareCategory(
      id: 'petrol-accessories',
      name: 'Petrol Bike Accessories',
      type: PartType.petrol,
      description:
          'Crash guards, handlebar grips, universal saddle stays, tank grips, mobile mounts, and weather covers.',
      icon: Icons.handyman_rounded,
      image: 'assets/images/categories/petrol_accessories.webp',
      popularParts: [
        'All-Weather Bike Cover',
        'Anti-Slip Handle Grips',
        'Mobile Phone Mount',
        'Waterproof Seat Cover'
      ],
    ),
  ];

  static const List<SupportedBrand> evBrands = [
    SupportedBrand(
      id: 'ola',
      name: 'Ola Scooter',
      category: BrandCategory.ev,
      tagline: 'S1 Pro • S1X • S1 Air Spares',
      popularModels: ['Ola S1 Pro Gen 1/2', 'Ola S1X / S1X+', 'Ola S1 Air'],
      icon: Icons.electric_scooter_rounded,
      image: 'assets/images/vehicles/ola_scooter.webp',
    ),
    SupportedBrand(
      id: 'ather',
      name: 'Ather',
      category: BrandCategory.ev,
      tagline: '450X • 450S • Rizta Spares',
      popularModels: [
        'Ather 450X Gen 3',
        'Ather 450S',
        'Ather Rizta',
        'Ather 450 Apex'
      ],
      icon: Icons.bolt_rounded,
      image: 'assets/images/vehicles/ather.webp',
    ),
    SupportedBrand(
      id: 'vida',
      name: 'Hero Vida',
      category: BrandCategory.ev,
      tagline: 'V1 Pro • V1 Plus Spares',
      popularModels: ['Vida V1 Pro', 'Vida V1 Plus', 'Vida V1 Lite'],
      icon: Icons.offline_bolt_rounded,
      image: 'assets/images/vehicles/hero_vida.webp',
    ),
    SupportedBrand(
      id: 'chetak',
      name: 'Bajaj Chetak',
      category: BrandCategory.ev,
      tagline: '2901 • Premium • Urbane Spares',
      popularModels: [
        'Chetak 2901',
        'Chetak Premium',
        'Chetak Urbane',
        'Chetak 3201'
      ],
      icon: Icons.ev_station_rounded,
      image: 'assets/images/vehicles/bajaj_chetak.webp',
    ),
    SupportedBrand(
      id: 'other-evs',
      name: 'Other EV',
      category: BrandCategory.ev,
      tagline: 'TVS iQube • River Indie • Simple',
      popularModels: [
        'TVS iQube Standard/S/ST',
        'River Indie',
        'Simple One',
        'Universal Controllers'
      ],
      icon: Icons.power_rounded,
      image: 'assets/images/vehicles/other_ev.webp',
    ),
  ];

  static const List<SupportedBrand> petrolBrands = [
    SupportedBrand(
      id: 'hero',
      name: 'Hero MotoCorp',
      category: BrandCategory.petrol,
      tagline: 'Splendor • HF Deluxe • Xpulse Spares',
      popularModels: [
        'Splendor Plus',
        'HF Deluxe',
        'Glamour 125',
        'Passion Pro',
        'Xpulse 200 4V'
      ],
      icon: Icons.two_wheeler_rounded,
      image: 'assets/images/vehicles/hero_motocorp.webp',
    ),
    SupportedBrand(
      id: 'honda',
      name: 'Honda 2 Wheeler',
      category: BrandCategory.petrol,
      tagline: 'Activa 6G • Shine • Unicorn Spares',
      popularModels: [
        'Activa 6G / 125',
        'Shine 125',
        'SP 125',
        'Dio 125',
        'Unicorn 160'
      ],
      icon: Icons.moped_rounded,
      image: 'assets/images/vehicles/honda_two_wheeler.webp',
    ),
    SupportedBrand(
      id: 'bajaj',
      name: 'Bajaj Auto',
      category: BrandCategory.petrol,
      tagline: 'Pulsar • Platina • Dominar Spares',
      popularModels: [
        'Pulsar 150 / 220',
        'Pulsar NS200 / N160',
        'Platina 110',
        'Dominar 400'
      ],
      icon: Icons.sports_motorsports_rounded,
      image: 'assets/images/vehicles/bajaj_auto.webp',
    ),
    SupportedBrand(
      id: 'tvs',
      name: 'TVS Motor',
      category: BrandCategory.petrol,
      tagline: 'Jupiter • Apache RTR • Ntorq Spares',
      popularModels: [
        'Jupiter 110 / 125',
        'Apache RTR 160/200 4V',
        'Ntorq 125',
        'Raider 125'
      ],
      icon: Icons.motorcycle_rounded,
      image: 'assets/images/vehicles/tvs_motor.webp',
    ),
    SupportedBrand(
      id: 'yamaha',
      name: 'Yamaha',
      category: BrandCategory.petrol,
      tagline: 'R15 • MT-15 • FZ • RayZR Spares',
      popularModels: [
        'R15 V4 / V3',
        'MT-15 V2',
        'FZ-S Fi V4',
        'Aerox 155',
        'RayZR 125'
      ],
      icon: Icons.speed_rounded,
      image: 'assets/images/vehicles/yamaha.webp',
    ),
    SupportedBrand(
      id: 're',
      name: 'Royal Enfield',
      category: BrandCategory.petrol,
      tagline: 'Classic 350 • Hunter • Bullet Spares',
      popularModels: [
        'Classic 350 Reborn',
        'Hunter 350',
        'Meteor 350',
        'Bullet 350',
        'Himalayan 450'
      ],
      icon: Icons.shield_rounded,
      image: 'assets/images/vehicles/royal_enfield.webp',
    ),
  ];
}

// --- Parks, woods, other green things ---

@grass: #cdebb0;        // Lch(90,32,128) also grassland, meadow, village_green, garden, allotments
@scrub: #c8d7ab;        // Lch(84,24,122)
@forest: #add19e;       // Lch(80,30,135)
@forest-text: #46673b;  // Lch(40,30,135)
@park: #c8facc;         // Lch(94,30,145)
@allotments: #c9e1bf;   // Lch(87,20,135)
@orchard: #aedfa3; // also vineyard, plant_nursery
@hedge: @forest;       // Lch(80,30,135)

// --- "Base" landuses ---

@built-up-lowzoom: #eee5dc;
@built-up-z12: #eee5dc;
@residential: #eee5dc;      // Lch(89,0,0)
@residential-line: #eee5dc; // Lch(75,0,0)
@retail: #eee5dc;           // Lch(89,16,30)
@retail-line: #eee5dc;      // Lch(70,25,30)
@commercial: #eee5dc;       // Lch(89,8.5,25)
@commercial-line: #eee5dc;  // Lch(75,12,25)
@industrial: #ebdbe8;       // Lch(89,9,330) (Also used for railway, wastewater_plant)
@industrial-line: #c6b3c3;  // Lch(75,11,330) (Also used for railway-line, wastewater_plant-line)
@farmland: #eef0d5;         // Lch(94,14,112)
@farmland-line: #c7c9ae;    // Lch(80,14,112)
@farmyard: #f5dcba;         // Lch(89,20,80)
@farmyard-line: #d1b48c;    // Lch(75,25,80)

// --- Transport ----

@transportation-area: #e9e7e2;
@apron: #dadae0;
@garages: #dfddce;
@parking: #eeeeee;
@parking-outline: saturate(darken(@parking, 40%), 20%);
@railway: @industrial;
@railway-line: @industrial-line;
@rest_area: #efc8c8; // also services

// --- Other ----

@bare_ground: #eee5dc;
@campsite: #def6c0; // also caravan_site, picnic_site
@cemetery: #aacbaf; // also grave_yard
@construction: #c7c7b4; // also brownfield
@heath: #d6d99f;
@mud: rgba(203,177,154,0.3); // produces #e6dcd1 over @land
@place_of_worship: #d0d0d0; // also landuse_religious
@place_of_worship_outline: darken(@place_of_worship, 30%);
@leisure: lighten(@park, 5%);
@power: darken(@industrial, 5%);
@power-line: darken(@industrial-line, 5%);
@sand: #f5e9c6;
@societal_amenities: #ffffe5;   // Lch(99,13,109)
@tourism: #660033;
@quarry: #c5c3c3;
@military: #f55;
@beach: #fff1ba;
@wastewater_plant: @industrial;
@wastewater_plant-line: @industrial-line;
@water_works: @industrial;
@water_works-line: @industrial-line;

// --- Sports ---

@pitch: #aae0cb;           // Lch(85,22,168) also track
@track: @pitch;
@stadium: @leisure; // also sports_centre
@golf_course: @campsite;

#landcover-low-zoom[zoom < 10],
#landcover[zoom >= 10] {
  polygon-fill: @bare_ground;
}


/* man_made=cutline */
#landcover-line {
  [zoom >= 14] {
    line-width: 3;
    line-join: round;
    line-cap: square;
    line-color: @grass;
    [zoom >= 16] {
      line-width: 6;
      [zoom >= 18] {
        line-width: 12;
      }
    }
  }
}

#landcover-area-symbols {

  ::first {
    [natural = 'mud'],
    [int_wetland = 'tidalflat'] {
      [zoom >= 9] {
        polygon-fill: @mud;
        [way_pixels >= 4]  { polygon-gamma: 0.75; }
        [way_pixels >= 64] { polygon-gamma: 0.3;  }
      }
    }
  }

  [int_wetland != null][zoom >= 10] {
    polygon-pattern-file: url('symbols/wetland.png');
    polygon-pattern-alignment: global;
  }
  [natural = 'reef'][zoom >= 10] {
    polygon-pattern-file: url('symbols/reef.png');
    polygon-pattern-alignment: global;
  }
  [zoom >= 13] {
    [int_wetland = 'marsh'],
    [int_wetland = 'saltmarsh'],
    [int_wetland = 'wet_meadow'] {
      polygon-pattern-file: url('symbols/wetland_marsh.png');
      polygon-pattern-alignment: global;
    }
    [int_wetland = 'reedbed'] {
      polygon-pattern-file: url('symbols/wetland_reed.png');
      polygon-pattern-alignment: global;
    }
    [int_wetland = 'mangrove'] {
      polygon-pattern-file: url('symbols/wetland_mangrove.png');
      polygon-pattern-alignment: global;
    }
    [int_wetland = 'swamp'] {
      polygon-pattern-file: url('symbols/wetland_swamp.png');
      polygon-pattern-alignment: global;
    }
    [int_wetland = 'bog'],
    [int_wetland = 'fen'],
    [int_wetland = 'string_bog'] {
      polygon-pattern-file: url('symbols/wetland_bog.png');
      polygon-pattern-alignment: global;
    }
    [landuse = 'salt_pond'] {
      polygon-pattern-file: url('symbols/salt_pond.png');
      polygon-pattern-alignment: global;
    }
    [natural = 'beach'],
    [natural = 'shoal'] {
      [surface = 'sand'] {
        polygon-pattern-file: url('symbols/beach.png');
        polygon-pattern-alignment: global;
      }
      [surface = 'gravel'],
      [surface = 'fine_gravel'],
      [surface = 'pebbles'],
      [surface = 'pebblestone'],
      [surface = 'shingle'],
      [surface = 'stones'],
      [surface = 'shells'] {
        polygon-pattern-file: url('symbols/beach_coarse.png');
        polygon-pattern-alignment: global;
      }
    }
    [natural = 'scrub'] {
      polygon-pattern-file: url('symbols/scrub.png');
      polygon-pattern-alignment: global;
    }
  }

  //Also landuse = forest, converted in the SQL
  [natural = 'wood'][zoom >= 13]::wood {
    polygon-pattern-file: url('symbols/leaftype_unknown.svg'); // Lch(55,30,135)
    [leaf_type = "broadleaved"] { polygon-pattern-file: url('symbols/leaftype_broadleaved.svg'); }
    [leaf_type = "needleleaved"] { polygon-pattern-file: url('symbols/leaftype_needleleaved.svg'); }
    [leaf_type = "mixed"] { polygon-pattern-file: url('symbols/leaftype_mixed.svg'); }
    [leaf_type = "leafless"] { polygon-pattern-file: url('symbols/leaftype_leafless.svg'); }
    polygon-pattern-alignment: global;
    opacity: 0.4; // The entire layer has opacity to handle overlapping forests
  }
}

#landuse-overlay {
  [landuse = 'military'][zoom >= 8][way_pixels > 900],
  [landuse = 'military'][zoom >= 13] {
    polygon-fill: #ff5555;
    polygon-opacity: 0.08;
    polygon-pattern-file: url('patterns/military_red_hatch.svg');
    polygon-pattern-alignment: global;
    line-color: @military;
    line-opacity: 0.24;
    line-width: 1.0;
    line-offset: -0.5;
    [zoom >= 15] {
      line-width: 2;
      line-offset: -1.0;
    }
  }

  [military = 'danger_area'][zoom >= 9] {
    polygon-fill: #ff5555;
    polygon-opacity: 0.1;
    polygon-pattern-file: url('patterns/danger_red_hatch.svg');
    polygon-pattern-alignment: global;
    line-color: @military;
    line-opacity: 0.2;
    line-width: 2;
    line-offset: -1.0;
  }
}

#cliffs {
  [natural = 'cliff'][zoom >= 13] {
    line-pattern-file: url('symbols/cliff.svg');
    [zoom >= 15] {
      line-pattern-file: url('symbols/cliff2.svg');
    }
  }
  [natural = 'ridge'][zoom >= 14] {
    line-pattern-file: url('symbols/ridge-mid.svg');
    [zoom >= 15] {
      line-pattern-file: url('symbols/ridge2.svg');
    }
  }
  [natural = 'arete'][zoom >= 14] {
    line-pattern-file: url('symbols/arete-mid.svg');
    [zoom >= 15] {
      line-pattern-file: url('symbols/arete2.svg');
    }
  }
  [man_made = 'embankment'][zoom >= 15]::man_made {
    line-pattern-file: url('symbols/embankment.svg');
  }
}

#barriers {
  [zoom >= 16] {
    line-width: 0.4;
    line-color: #444;
  }
  [feature = 'barrier_hedge'][zoom >= 16] {
    line-width: 1.5;
    line-color: @hedge;
    [zoom >= 17] {
      line-width: 2;
    }
    [zoom >= 18] {
      line-width: 3;
    }
    [zoom >= 19] {
      line-width: 4;
    }
    [zoom >= 20] {
      line-width: 5;
    }
  }
  [feature = 'historic_citywalls'],
  [feature = 'barrier_city_wall'] {
    [zoom >= 15] {
      line-width: 1;
      line-color: lighten(#444, 30%);
    }
    [zoom >= 16] {
      line-width: 1.5;
    }
    [zoom >= 17] {
      line-width: 2;
      barrier/line-width: 0.4;
      barrier/line-color: #444;
    }
    [zoom >= 18] {
      line-width: 3;
    }
    [zoom >= 19] {
      line-width: 4;
    }
    [zoom >= 20] {
      line-width: 5;
    }
  }
}

#tourism-boundary {
  [tourism = 'zoo'][zoom >= 10][way_pixels >= 750],
  [tourism = 'zoo'][zoom >= 17],
  [tourism = 'theme_park'][zoom >= 10][way_pixels >= 750],
  [tourism = 'theme_park'][zoom >= 17] {
    a/line-width: 1;
    a/line-offset: -0.5;
    a/line-color: @tourism;
    a/line-opacity: 0.5;
    a/line-join: round;
    a/line-cap: round;
    [zoom >= 17],
    [way_pixels >= 60] {
      b/line-width: 4;
      b/line-offset: -2;
      b/line-color: @tourism;
      b/line-opacity: 0.3;
      b/line-join: round;
      b/line-cap: round;
    }
    [zoom >= 17] {
      a/line-width: 2;
      a/line-offset: -1;
      b/line-width: 6;
      b/line-offset: -3;
    }
  }
}

#text-line {
  [feature = 'natural_arete'][zoom >= 15],
  [feature = 'natural_cliff'][zoom >= 15],
  [feature = 'natural_ridge'][zoom >= 15],
  [feature = 'man_made_embankment'][zoom >= 15] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-fill: #999;
    text-size: 10;
    text-face-name: @book-fonts;
    text-placement: line;
    text-dy: 8;
    text-vertical-alignment: middle;
    text-spacing: 400;
  }
}

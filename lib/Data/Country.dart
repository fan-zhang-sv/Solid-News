var getCountryName = {
  'us': 'United States',
  'gb': 'United Kingdom',
  'ie': 'Ireland',
  'ca': 'Canada',
  'au': 'Australia',
  'nz': 'New Zealand',
  'sg': 'Singapore',
  'hk': 'Hong Kong',
  'cn': 'China',
  'tw': 'Taiwan',
  'jp': 'Japan',
  'kr': 'South Korea',
};

var getCountryLang = {
  'us': 'en-US',
  'gb': 'en-GB',
  'ie': 'en-IE',
  'ca': 'en-CA',
  'au': 'en-AU',
  'nz': 'en-NZ',
  'sg': 'en-SG',
  'hk': 'zh-HK',
  'cn': 'zh-CN',
  'tw': 'zh-TW',
  'jp': 'ja-JP',
  'kr': 'ko-KR',
};

String getEmojiName(String acronym) {
  return ':flag-' + acronym + ':';
}

var getGroup = {
  'en': [
    'us',
    'gb',
    'ie',
    'ca',
    'au',
    'nz',
    'sg',
  ],
  'cn': [
    'cn',
    'hk',
    'tw',
  ],
  'east-asia': [
    'cn',
    'hk',
    'tw',
    'jp',
    'kr',
    'sg',
  ],
};

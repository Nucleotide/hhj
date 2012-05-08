# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :organization do
    factory :spartan_teknillinen_yliopisto do
      name  'Spartan Teknillinen Yliopisto'
      key   'sty'
      _id   '4f6b1edf91bc2b33d3010000'
    end

    factory :luonnontieteellinen_tiedekunta do
      name  'Luonnontieteellinen tiedekunta'
      key   'ltk'
      _id   '4f6b1edf91bc2b33d3010100'
      parent { FactoryGirl.create(:spartan_teknillinen_yliopisto) }
    end

    factory :kirjasto do
      name  'Kirjasto'
      key   'lib'
      _id   '4f6b1edf91bc2b33d3010200'
      parent { FactoryGirl.create(:spartan_teknillinen_yliopisto) }
    end

    factory :kemian_laitos do
      name  'Kemian laitos'
      key   'kl'
      _id   '4f6b1edf91bc2b33d3010101'
      parent { FactoryGirl.create(:luonnontieteellinen_tiedekunta) }
    end

    factory :fysiikan_laitos do
      name  'Fysiikan laitos'
      key   'fl'
      _id   '4f6b1edf91bc2b33d3010102'
      parent { FactoryGirl.create(:luonnontieteellinen_tiedekunta) }
    end
  end



end

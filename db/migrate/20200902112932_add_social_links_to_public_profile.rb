class AddSocialLinksToPublicProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :public_profiles, :amazon, :string
    add_column :public_profiles, :android_play_store, :string
    add_column :public_profiles, :apple_app_store, :string
    add_column :public_profiles, :apple_music, :string
    add_column :public_profiles, :apple_podcast, :string
    add_column :public_profiles, :etsy, :string
    add_column :public_profiles, :facebook, :string
    add_column :public_profiles, :instagram, :string
    add_column :public_profiles, :linkedin, :string
    add_column :public_profiles, :patreon, :string
    add_column :public_profiles, :payment, :string
    add_column :public_profiles, :pinterest, :string
    add_column :public_profiles, :poshmark, :string
    add_column :public_profiles, :snapchat, :string
    add_column :public_profiles, :soundcloud, :string
    add_column :public_profiles, :spotify, :string
    add_column :public_profiles, :tiktok, :string
    add_column :public_profiles, :twitch, :string
    add_column :public_profiles, :twitter, :string
    add_column :public_profiles, :whatsapp, :string
    add_column :public_profiles, :youtube, :string
    add_column :public_profiles, :wipchat, :string
  end
end

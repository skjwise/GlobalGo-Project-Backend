class CountriesController < ApplicationController
    def index
        @countries = Country.all
        render json: @countries
    end
    
    def get_project_count
    @countries = Country.all
    country_project_counts = []
    @countries.each do |country|
        project_count = country.projects.count
        country_project_counts.push([country[:iso3166CountryCode], project_count])
    end
    render json: country_project_counts
    end
    
    def get_project_theme_count
    @countries = Country.all
    theme_name_array = params[:themes]
    theme_array = self.get_theme_ids(theme_name_array)
    # theme_array = theme_name_array.map do |theme|
    #   Theme.find_by(name: theme).id
    # end
    country_project_counts = []
    @countries.each do |country|
        project_count = country.projects.where(theme_id: theme_array).count
        country_project_counts.push([country[:iso3166CountryCode], project_count])
    end
    render json: country_project_counts
    end
    
    def get_projects
    country = Country.find_by(iso3166CountryCode: params["countryCode"])
    country_projects = country.projects
    render json: country_projects
    end
    
    def get_theme_ids(theme_name_array)
    theme_array = theme_name_array.map do |theme|
        if theme["name"]
        Theme.find_by(name: theme["name"]).id
        else
        Theme.find_by(name: theme).id
        end
    end
    theme_array
    end
    
    def get_theme_projects
    theme_name_array = params[:themes]
    # theme_array = theme_name_array.map do |theme|
    #   Theme.find_by(name: theme).id
    # end
    theme_array = self.get_theme_ids(theme_name_array)
    country = Country.find_by(iso3166CountryCode: params["countryCode"])
    country_projects = country.projects.where(theme_id: theme_array)
    render json: country_projects
    end
    
    def create
    json = Country.queryAllCountries
    NormalizeCountry.to = :alpha3
    json["regions"]["region"].each do |region|
        region["countries"]["country"].each do |country|
        @country = Country.find_or_create_by(name: country["name"], iso3166CountryCode: NormalizeCountry.convert(country["iso3166CountryCode"]))
        @country.save
        end
    end
    render json: Country.all
    end
end

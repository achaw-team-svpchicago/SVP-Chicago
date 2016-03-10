class RfpFormsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @rfp_forms = RfpForm.all
  end

  def show
    @rfp_form = RfpForm.find(params[:id])
  end

  def rfp_form
     @rfp_form = RfpForm.new
  end
   
  def create
    @rfp_form = RfpForm.new(rvp_params)
  end
   
   
  def rfp_params
    params.require(:rfp_form).permit(:organization,
       :address,
       :organization_phone,
       :executive_director,
       :executive_director_phone,
       :executive_director_email,
       :proposal_contact,
       :proposal_contact_phone,
       :proposal_contact_email,
       :number_of_employees,
       :number_of_volunteers,
       :number_of_active_board_memebers,
       :organizational_budget,
       :history,
       :current_programs,
       :program, 
       :target_population,
       :current_number_served,
       :ages_served,
       :area_served,
       :program_description,
       :issue,
       :focus,
       :effectiveness,
       :program2, 
       :target_population2,
       :current_number_served2,
       :ages_served2,
       :area_served2,
       :program_description2,
       :issue2,
       :focus2,
       :effectiveness2,
       :impact_on_sector,
       :results_and_measurements,
       :priorities_and_goals,
       :building_needs,
       :projects,
       :activities,
       :name, 
       :title_and_bio,
       :leadership_changes,
       :ensure_success,
       :board_member,
       :background,
       :meetings,
       :percentage_of_board_members,
       :fiscal_year_end,
       :current_year_end,
       :revenues, 
       :expenditures, 
       :frequency,
       :expectations,
       :spending,
       :allocation_percentage,
       :donations,
       :grants,
       :generated_revenue,
       :funding,
       :investment,
       :national_affiliations,
       :responsibilities,
       :operations,
       :new_programs,
       :fund_raising,
       :cost_sharing,
       :governance,
       :leverage,
       :legal_actions,

    )
  end
end


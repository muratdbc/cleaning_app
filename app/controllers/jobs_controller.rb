class JobsController < ApplicationController
  def create
    job = Job.new(job_params)

    if job.save
        render json: {status: 'Job created successfully'}, status: :created
      else
        render json: { errors: job.errors.full_messages }, status: :bad_request
      end
  end
  def index
    jobs=Job.all
    render json: {jobs: jobs}, status: :ok
  end
  def show
    job=Job.find(params[:id])
    render json: {job: job}, status: :ok
  end

  private

  def job_params
    params.require(:job).permit(:job_date, :notes, :job_time)
  end
end

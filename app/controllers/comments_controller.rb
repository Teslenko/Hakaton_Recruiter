class CommentsController < ApplicationController
	def create
	    @candidate = Candidate.find(params[:candidate_id])
	    @comment = @candidate.comments.create(comment_params)
	    redirect_to candidate_path(@candidate)
  	end
  	 def destroy
	    @candidate = Candidate.find(params[:candidate_id])
	    @comment = @candidate.comments.find(params[:id])
	    @comment.destroy
	    redirect_to candidate_path(@candidate)
  	end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

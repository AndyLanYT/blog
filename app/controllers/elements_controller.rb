class ElementsController < ApplicationController
    # load_and_authorize_resource
    before_action :set_post, only: %i[create edit update destroy]
    before_action :set_element, only: %i[edit update destroy]
  
    def create
        @element = @post.elements.build(element_params.merge({ user_id: current_user.id, post_id: params[:post_id] }))

        if @element.save
            notice = nil
        else
            notice = @element.errors.full_messages.join(". ") << "."
        end
        redirect_to edit_post_path(@post)
    end
  
    def edit; end
  
    def update
        if @element.update(element_params)
            redirect_to edit_post_path(@post)
        else
            render 'edit'
        end
    end

    def destroy
        @element.destroy
        redirect_to edit_post_path(@post)
    end
  
    private

    def set_post
        @post = Post.find(params[:post_id])
    end
  
    def set_element
        @element = Element.find(params[:id])
    end

    def element_params
        params.require(:element).permit(:element_type, :content, :image)
    end
end

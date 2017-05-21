class HomeController < ApplicationController
  def register
        #사용자가 데이터를 입력할 화면
        #자동으로 액션 이름과 같은 화면을 불러서 사용자에게 보여줘라
        #실행하게 하려면 라우트로 가라!
        #굳이 저장되었습니다 라는 화면이 필요없기때문에 >>
  end
    
    def create
        
    #입력받은 데이터를 실제DB에 저장할 액션 여기서 Post는 모델의 Post
    #포스트 모델에서 하나를 새로 만들고 보내겠다
    @post = Post.new
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save 
    
    #사용자가 입력한걸로 바꾸려면 params
    #따옴표를 지우고 콜론을 붙여줄 것 성능이 더 좋다
    #반드시 큰따옴표로 할것
    redirect_to "/home/show/#{@post.id}"
    
    
    end
    
    #read 
    
    def index
        
    # 모든post들을 보여주는 view   
    
    @posts = Post.all
    
    end
    # show 같은 경우는 하나의 게시글을 골라야 해서 find사용
    
    def show
        
        # 한개의 post를 보여주는 view
        
        @post = Post.find(params[:post_id])
        
    end
    
    #update
    
    def edit
    #사용자가 데이터를 입력할 화면
        @post = Post.find(params[:post_id])
    end
    
    def update
    # 입력받은 데이터를 실제 DB저장할 액션
        @post = Post.find(params[:post_id])
        # 수정할 코드
        @post.title = params[:input_title]
        @post.content = params[:input_content]
        @post.save 
        redirect_to "/home/show/#{@post.id}"
    end
    
    # Delete
    
    def destroy
        # 한개의 post를 삭제하는 액션
        @post = Post.find(params[:post_id])
        @post.destroy
        redirect_to "/"
    end
    
  
  
  
  def home
    unless user_signed_in?
        redirect_to "/index"
    end
  end
  
end
    